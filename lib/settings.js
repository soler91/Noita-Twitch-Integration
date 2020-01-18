const path = require("path")
const fs = require("fs")
const baseDir = path.join(__dirname, "../settings/")
class Settings {
    constructor() {
        this.props = new Map()
        this.loadProps()
    }

    get(key) {
        const exists = this.props.has(key)
        if (!exists) {
            this.props.set(key, {})
            this.save(key)
        }
        return this.props.get(key)
    }

    set(prop, val) {
        this.props.set(prop, val)

        this.save(prop)
    }

    setKey(prop, key, val) {
        this.props.get(prop)[key] = val
        this.save(prop)
    }

    setSubkey(prop, key, subKey, val) {
        if (typeof this.props[key] == "undefined") {
            this.props[key] = {}
        }
        this.props[key][subKey] = val
        this.save(prop)
    }

    loadProps() {
        const files = fs.readdirSync(baseDir)
        for (const file of files) {
            const key = file.split(".")[0]
            const data = JSON.parse(fs.readFileSync(path.join(baseDir + file)))
            this.props.set(key, data)
        }
    }

    save(key) {
        try {
            const filepath = path.join(baseDir, key + ".json")
            fs.writeFileSync(filepath, JSON.stringify(this.props.get(key), null, 2))
        } catch (error) {
            console.log(error)
        }
    }
}

module.exports = Settings