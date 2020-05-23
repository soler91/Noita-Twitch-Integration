const ws = require("ws")
const fs = require("fs")
const path = require("path")
class Outcomes {
    constructor(parent) {
        this.parent = parent
        this.dir = path.join(__dirname, "../twitch_fragments/outcomes")
        this.loadOutcomes()
    }

    get settings() {
        return this.parent.settings.get("outcomes")
    }

    drawByType(num, types) {
        const options = Object.values(this.getOutcomes())
        const counter = {}
        for (let i = 1; i <= num; i++) {
            let type = this.pickRandom(types)
            if (typeof counter[type.name] == "undefined") {
                counter[type.name] = 0
            }
            counter[type.name] += 1
        }
        let final = []
        for (const option of Object.keys(counter)) {
            const filtered = options.filter((val) => {
                return val.enabled && val.type == option
            })

            for (let i = 0; i < counter[option]; i++) {
                final.push(this.pickRandom(filtered, true))
            }
        }

        final = JSON.parse(JSON.stringify(final)).map(val => {
            val.votes = 0
            return val
        }).sort((a, b) => {
            return a.name.length - b.name.length
        })
        return final
    }

    getOutcomes() {
        return JSON.parse(JSON.stringify(this.settings))
    }

    defaultSettings(data, id) {
        let lines = data.split(/(\r\n|\r|\n)/gm)
        let info = []
        for (let i in lines) {
            if (lines[i].startsWith("--")) {
                info.push(lines[i].substr(2, lines[i].length))
            }
            if (info.length > 4) { break }
        }
        let [name, description, type, rarity, comment] = info
        this.parent.settings.setKey("outcomes", id, {
            id,
            name: name && name.trim() || id,
            enabled: true,
            comment: comment || "What does this do ?",
            description: description || "Description below name in game",
            type: (type && type.trim()) || "unknown",
            rarity: Number(rarity) || 50
        })
    }

    loadOutcomes() {
        const files = fs.readdirSync(this.dir)
        for (const file of files) {
            const name = file.split(".")[0]
            if (typeof this.settings[name] == "undefined") {
                const data = fs.readFileSync(path.join(this.dir, file), "utf8")
                this.defaultSettings(data, name)
            }
        }
    }

    getLua() {
        let lua = ""
        const files = fs.readdirSync(this.dir)
        for (const file of files) {
            const name = file.split(".")[0]
            const data = fs.readFileSync(path.join(this.dir, file), "utf8")
            if (typeof this.settings[name] == "undefined") {
                this.defaultSettings(data, name)
            }
            lua += data + "\n"
        }
        return lua
    }

    pickRandom(options, trim = false) {
        let sum = options.reduce((accumulator, val) => accumulator + val.rarity, 0)
        let rand = Math.random() * sum
        let total = 0
        let lastIdx = -1
        let selectedIdx = null

        for (let i in options) {
            let rarity = options[i].rarity
            total += rarity
            if (rarity > 0) {
                if (rand <= total) {
                    selectedIdx = i
                    break
                }
                lastIdx = i
            }

            if (i === options.length - 1) {
                selectedIdx = lastIdx
            }
        }

        let result = options[selectedIdx]

        if (trim) {
            options.splice(selectedIdx, 1)
        }

        return result
    }
}

class Noita {
    constructor(parent) {
        this.port = 9090
        this.noitaClient = null
        this.server = new ws.Server({ port: this.port })

        this.outcomes = new Outcomes(parent)
        this.twitch = parent.twitch
        this.parent = parent

        this.voting = false
        this.timeLeft = 0
        this.userVotes = {}
        this.choices = []
        this.lastContact = Date.now()
        this.queueDelay = 5000
        this.queue = []
        this.init()
    }

    get settings() {
        return this.parent.settings.get("noita")
    }

    init() {
        this.twitch.client.on("message", (ch, userstate, message, self) => {
            if (self) return
            this.handleVote(userstate['user-id'], message)
        })
        this.server.on("connection", (socket) => {
            if (!this.isConnectionLocalhost(socket)) {
                socket.terminate()
                return
            }

            socket.on("message", (data) => {
                this.handleData(data, socket)
            })

            socket.on("close", () => {
                if (this.noitaClient === socket) {
                    console.log("BYE NOITA")
                    this.noitaClient = null
                    this.choices = []
                    this.updateObsFile(true)
                }
            })
        })
        this.gameLoop()
    }

    isConnectionLocalhost(ws) {
        const addr = ws._socket.remoteAddress
        return (addr == "::1") || (addr == "127.0.0.1") || (addr == "localhost") || (addr == "::ffff:127.0.0.1")
    }

    handleData(data, ws) {
        let dataJSON = null
        if (data.slice(0, 1) == ">") {
            if (data == ">RES> [no value]") { return }
            console.log(data)
            return
        } else {
            try {
                dataJSON = JSON.parse(data)
            } catch (e) {
                console.log(data)
                console.error(e)
                return
            }
        }

        if (dataJSON.kind === "heartbeat") {
            this.lastContact = Date.now()
            if (this.noitaClient != ws) {
                console.log("Registering game client")
                this.noitaClient = ws
                this.choices = []
                this.toGame(`set_print_to_socket(true)`)
                this.toGame(`GamePrint('Noita and TwitchBot connected.')`)

                this.noitaFile("game_ui.lua")

                this.noitaFile("action_handlers.lua")
                this.noitaFile("utils.lua")
                this.noitaFile("potion_material.lua")
                this.toGame(this.outcomes.getLua())
            }
        }
    }

    handleVote(user, vote) {
        if (!this.voting) {
            return
        }
        let iv = vote.match(/^\d+/)
        iv = iv && iv[0]
        iv = parseInt(iv)
        if (isNaN(iv)) {
            return
        }
        if (iv < 0 || iv > this.choices.length) {
            return
        }
        this.userVotes[user] = iv
    }

    updateVotes() {
        for (const choice of this.choices) {
            choice.votes = 0
        }
        for (let uid in this.userVotes) {
            let vote = this.userVotes[uid]
            if (vote > 0 && vote <= this.choices.length) {
                this.choices[vote - 1].votes += 1
            }
        }
    }

    inGameChoices() {
        let choices = []
        let index = 1
        let show = this.settings.display_votes

        for (const choice of this.choices) {
            choices.push(`"${index}> ${choice.name} ${show ? '(' + choice.votes + ')' : ""}"`)
            index += 1
        }
        return `{${choices.join(",")}}`
    }

    updateObsFile(purge) {
        const obsFile = path.join(__dirname, "../obs.txt")
        if (purge) {
            fs.writeFileSync(obsFile, "")
            return
        }
        const template = this.parent.settings.get("obs_template")

        let index = 1
        let content = []
        let show = this.settings.display_votes
        if (this.voting) {
            content.push(this.interpolate(template.during_voting, { seconds: this.timeLeft }))
        }
        else {
            content.push(this.interpolate(template.between_votes, { seconds: this.timeLeft }))
        }
        for (const choice of this.choices) {
            let votes = choice.votes || 0
            votes = `${template.wrap_votes_left}${votes}${template.wrap_votes_right}`
            let i = `${template.wrap_index_left}${index}${template.wrap_index_right}`
            let name = `${template.wrap_choice_left}${choice.name}${template.wrap_choice_right}`
            if (!show) {
                votes = ""
            }
            content.push(this.interpolate(template.choice, { index: i, choice: name, votes }))
            index += 1
        }
        let final = template.vertical ? content.join("\n") : content.join(template.divider)
        fs.writeFileSync(obsFile, final)
    }

    getWinner() {
        this.choices.sort((a, b) => b.votes - a.votes)
        let winners = this.choices.filter((val) => val.votes == this.choices[0].votes)
        let winner = null
        if (winners.length > 1) {
            winner = winners[Math.floor(Math.random() * winners.length)]
        }
        else {
            winner = winners[0]
        }
        return {
            func: `twitch_${winner.id}()`,
            name: winner.name,
            desc: winner.description
        }
    }

    toGame(code) {
        if (!this.noitaClient) {
            console.log("Push to queue")
            this.queue.push(code)
            return
        }

        this.noitaClient.send(code)

        if (this.queue.length > 0) {
            setTimeout(() => {
                this.toGame(this.queue.shift())
            }, this.queueDelay)
        }
    }

    noitaFile(filename) {
        let fileData = fs.readFileSync(path.join(__dirname, "../twitch_fragments/" + filename))
        this.toGame(fileData)
    }

    isPaused() {
        return Date.now() - this.lastContact > 3000
    }

    async gameLoop() {
        while (true) {
            this.voting = false
            while (this.noitaClient == null) {
                await this.sleep(5)
            }
            await this.doQuestion()
        }
    }

    async doQuestion() {
        if (!this.settings.enabled) {
            if (this.settings.game_ui) {
                if (!this.noitaClient) return
                this.noitaClient.send(`clear_display()`)
            }
            await this.sleep(1)
            return
        }

        this.timeLeft = this.settings.time_between_votes
        while (this.timeLeft > 0) {
            if (this.noitaClient == null) return

            if (!this.settings.game_ui) {
                this.noitaClient.send(`clear_display()`)
            }

            if (this.settings.game_ui) {
                this.noitaClient.send(`set_countdown(${this.timeLeft})`)
            }

            if (this.settings.obs_overlay) {
                this.updateObsFile()
            }
            this.timeLeft -= 1
            await this.sleep(1)
        }

        if (!this.settings.enabled) {
            if (this.settings.game_ui) {
                if (!this.noitaClient) return
                this.noitaClient.send(`clear_display()`)
            }
            await this.sleep(1)
            return
        }

        if (this.noitaClient == null) return

        this.voting = true
        this.userVotes = {}

        this.choices = this.outcomes.drawByType(this.settings.options_per_vote, this.settings.option_types)
        if (this.settings.game_ui) {
            this.noitaClient.send(`update_outcome_display(${this.inGameChoices()}, "0")`)
        }
        if (this.settings.obs_overlay) {
            this.updateObsFile()
        }

        this.timeLeft = this.settings.voting_time

        while (this.timeLeft > 0) {
            if (this.noitaClient == null) return

            if (!this.isPaused()) {
                this.updateVotes()

                if (!this.settings.game_ui) {
                    this.noitaClient.send(`clear_display()`)
                }

                if (this.settings.game_ui) {
                    this.noitaClient.send(`update_outcome_display(${this.inGameChoices()}, ${this.timeLeft})`)
                }

                if (this.settings.obs_overlay) {
                    this.updateObsFile()
                }

                this.timeLeft -= 1
            }
            await this.sleep(1)
        }

        if (!this.settings.enabled) {
            if (this.settings.game_ui) {
                if (!this.noitaClient) return
                this.noitaClient.send(`clear_display()`)
            }
            await this.sleep(1)
            return
        }

        if (this.noitaClient == null) return

        let winner = this.getWinner()
        this.choices = []
        this.noitaClient.send("clear_display()")
        this.noitaClient.send(`GamePrintImportant("${winner.name}","${winner.desc}")`)
        this.noitaClient.send(winner.func)
    }

    affectTimer(val) {
        let newVal = this.timeLeft + val
        this.timeLeft = newVal <= 0 ? 3 : newVal
    }

    sleep(secs) {
        return new Promise(res => {
            setTimeout(() => {
                res()
            }, secs * 1000)
        })
    }

    getObjPath(objPath, obj, fallback = '') {
        return objPath.split('.').reduce((res, key) => res[key] || fallback, obj);
    }

    interpolate(template, variables, fallback) {
        const regex = /\${[^{]+}/g
        return template.replace(regex, (match) => {
            const objPath = match.slice(2, -1).trim();
            return this.getObjPath(objPath, variables, fallback);
        })
    }
}

module.exports = Noita
