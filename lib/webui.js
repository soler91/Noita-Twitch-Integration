const express = require("express")
const path = require("path")
const open = require("open")
class WebUI {
    constructor(parent) {
        this.port = 8989
        this.parent = parent
        this.dir = path.join(__dirname, "../webui")
        this.app = express()
        this.app.use(express.static(this.dir))
        this.app.use(express.urlencoded({ extended: true }));
        this.app.use(express.json());
        this.init()
    }

    init() {
        this.app.get("/outcomes", (req, res) => {
            res.json(this.parent.settings.get("outcomes"))
            res.end()
        })

        this.app.get("/noita", (req, res) => {
            res.json(this.parent.settings.get("noita"))
            res.end()
        })

        this.app.get("/twitch", (req, res) => {
            res.json(this.parent.settings.get("twitch"))
            res.end()
        })

        this.app.post("/outcomes/:key", (req, res) => {
            let { key } = req.params
            let val = req.body
            this.parent.settings.setKey("outcomes", key, val)
            res.end()
        })

        this.app.post("/noita", (req, res) => {
            let val = req.body
            this.parent.settings.set("noita", val)
            res.end()
        })

        this.app.post("/twitch", (req, res) => {
            let val = req.body
            this.parent.settings.set("twitch", val)
            res.end()
        })

        this.app.post("/togame/:option", (req, res) => {
            let {option} = req.params
            option = `twitch_${option}()`
            if (this.parent.noita) {
                if (this.parent.noita.noitaClient) {
                    this.parent.noita.noitaClient.send(option)
                }
            }
            res.end()
        })

        this.app.post("/misc/:name", (req, res) => {
            let {name} = req.params
            let body = req.body
            if (name == "reload_outcomes") {
                if (this.parent.noita) {
                    this.parent.noita.outcomes.loadOutcomes()
                }
            }
            else if (name == "timeleft") {
                let {val} = body
                if (isNaN(val)) { return }
                if (this.parent.noita) {
                    this.parent.noita.affectTimer(val)
                }
            }
            res.end()
        })

        this.app.listen(this.port, "127.42.0.69")
        open(`http://127.42.0.69:${this.port}/`)
    }
}

module.exports = WebUI