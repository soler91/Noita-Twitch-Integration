const Settings = require("./lib/settings")
const Twitch = require("./lib/twitch")
const Noita = require("./lib/noita")
const WebUI = require("./lib/webui")
class Main{
    constructor() {
        this.initSubmodules()
    }

    initSubmodules() {
        this.settings = new Settings()
        this.twitch = new Twitch(this)
        this.noita = new Noita(this)
        this.webui = new WebUI(this)
    }
}

const bot = new Main()