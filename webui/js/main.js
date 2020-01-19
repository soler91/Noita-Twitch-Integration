Vue.component("comp-outcomes", {
    props: ["model"],
    data: function () {
        return {
            temp: {},
            activeKey: ""
        }
    },
    updated: function () {
        if (this.activeKey === "" || Object.keys(this.temp).length == 0) {
            this.tempModel()
            this.activeKey = Object.keys(this.$props.model)[0] || ""
        }
    },
    methods: {
        tempModel: function () {
            this.temp = JSON.parse(JSON.stringify(this.$props.model))
        },
        apply: function (id) {
            axios.post(`/outcomes/${id}`, this.temp[id])
        },
        toGame: function (id) {
            axios.post(`/togame/${id}`)
        },
        isNumber(val) {
            if (typeof val == "number") {
                return true
            }
            else {
                return "Not a number"
            }
        }
    },
    template: `<div>
    <v-navigation-drawer app clipped permanent >
        <v-list-item>
            <v-list-item-content>
                <v-list-item-title class="title">
                    Outcomes
                </v-list-item-title>
            </v-list-item-content>
        </v-list-item>
        <v-divider></v-divider>

    <v-list dense nav>
        <v-list-item v-for="item in model" :key="item.title" link>

            <v-list-item-content @click="activeKey = item.id">
                <v-list-item-title>{{ item.name }}</v-list-item-title>
            </v-list-item-content>

        </v-list-item>
    </v-list>

    </v-navigation-drawer>
    <v-container fluid v-if="typeof temp[activeKey] != 'undefined'">
        <v-card>
            <v-card-title>{{temp[activeKey].name}}</v-card-title>
            <v-divider></v-divider>
            <v-card-text>
                <v-row>
                    <v-col cols="6" md="4">
                        <v-text-field label="Type" v-model="temp[activeKey].type" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="6" md="4">
                        <v-text-field label="Rarity" v-model.number="temp[activeKey].rarity" type="number" :rules="[isNumber]" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="6" md="2">
                        <v-checkbox label="Enabled" v-model="temp[activeKey].enabled">
                        </v-checkbox>
                    </v-col>
                    <v-col cols="6" md="2">
                        <v-btn @click="toGame(temp[activeKey].id)">toGame</v-btn>
                    </v-col>
                </v-row>
                

                <v-text-field label="Name" v-model="temp[activeKey].name" outlined>
                </v-text-field>

                <v-text-field label="Description" v-model="temp[activeKey].description" outlined>
                </v-text-field>

                <v-textarea label="Comment" v-model="temp[activeKey].comment" outlined>
                </v-textarea>

                <v-divider></v-divider>

                <v-card-actions>
                    <v-row align="center" justify="center">
                    <v-btn @click="apply(temp[activeKey].id)">Apply</v-btn> <v-btn @click="tempModel()">Cancel</v-btn>
                    </v-row>
                </v-card-actions>
            </v-card-text>
        </v-card>
    </v-container>
    </div>`
})

Vue.component("comp-noita", {
    props: ["model"],
    data: function () {
        return {
            temp: {},
            activeKey: ""
        }
    },
    created: function () {
        if (this.activeKey === "" || Object.keys(this.temp).length == 0) {
            this.tempModel()
            this.activeKey = Object.keys(this.$props.model)[0] || ""
        }
    },
    methods: {
        tempModel: function () {
            this.temp = JSON.parse(JSON.stringify(this.$props.model))
        },
        apply: function (id) {
            axios.post(`/noita`, this.temp)
        },
        addOption: function () {
            this.temp.option_types.push({ name: "unnamed", rarity: 50 })
        },
        rmOption: function (index) {
            this.temp.option_types.splice(index, 1)
        },
        isNumber(val) {
            if (typeof val == "number") {
                return true
            }
            else {
                return "Not a number"
            }
        }
    },
    template: `<div>
    <v-container fluid>
        <v-card>
            <v-card-title>Noita Settings</v-card-title>
            <v-divider></v-divider>
            <v-card-text>
                <v-row>
                    <v-col cols="6" md="2">
                        <v-checkbox label="Enabled" v-model="temp.enabled">
                        </v-checkbox>
                    </v-col>
                    <v-col cols="6" md="2">
                        <v-checkbox label="In-Game UI" v-model="temp.game_ui">
                        </v-checkbox>
                    </v-col>
                    <v-col cols="6" md="2">
                        <v-checkbox label="OBS Overlay" v-model="temp.obs_overlay">
                        </v-checkbox>
                    </v-col>
                    <v-col cols="6" md="2">
                        <v-checkbox label="Show Votes" v-model="temp.display_votes">
                        </v-checkbox>
                    </v-col>
                </v-row>
                
                <v-row>
                    <v-col cols="4" md="3">
                        <v-text-field label="Number of Options" v-model.number="temp.options_per_vote" type="number" :rules="[isNumber]" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="4" md="3">
                        <v-text-field label="Voting Time" v-model.number="temp.voting_time" type="number" :rules="[isNumber]" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="4" md="3">
                        <v-text-field label="Time Between Votes" v-model.number="temp.time_between_votes" type="number" :rules="[isNumber]" outlined>
                        </v-text-field>
                    </v-col>
                </v-row>

                <v-divider></v-divider>
                <v-card-title>Options</v-card-title>
                
                <v-row v-for="(item, index) in temp.option_types">
                    <v-col cols="5" md="5">
                        <v-text-field label="Name" v-model="temp.option_types[index].name" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="5" md="5">
                        <v-text-field label="Rarity" v-model.number="temp.option_types[index].rarity" type="number" :rules="[isNumber]" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="2" md="2">
                        <v-btn align="center" justify="center" icon small @click="rmOption(index)"><v-icon>mdi-close</v-icon></v-btn>
                    </v-col>
                </v-row>
                <v-btn block @click="addOption()"><v-icon>mdi-plus</v-icon></v-btn>

                <v-divider></v-divider>

                <v-card-actions>
                    <v-row align="center" justify="center">
                        <v-btn @click="apply()">Apply</v-btn> <v-btn @click="tempModel()">Cancel</v-btn>
                    </v-row>
                </v-card-actions>
            </v-card-text>
        </v-card>
    </v-container>
    </div>`
})

Vue.component("comp-twitch", {
    props: ["model"],
    data: function () {
        return {
            temp: {},
            tempId: "",
            activeKey: ""
        }
    },
    created: function () {
        if (this.activeKey === "" || Object.keys(this.temp).length == 0) {
            this.tempModel()
            this.activeKey = Object.keys(this.$props.model)[0] || ""
        }
    },
    computed: {
        rewards: function() {
            return Object.keys(this.temp["custom-rewards"])
        }
    },
    methods: {
        tempModel: function () {
            this.temp = JSON.parse(JSON.stringify(this.$props.model))
        },
        apply: function (id) {
            axios.post(`/twitch`, this.temp)
        },
        addReward: function (id) {
            this.$set(this.temp["custom-rewards"], id, {
                enabled: false,
                name: "Unnamed",
                comment: "What does it do?",
                msg_head: "",
                msg_body: "",
                func: ""
            })
        },
        rmReward: function (id) {
            this.$set(this.temp["custom-rewards"], id, undefined)
        }
    },
    template: `
    <v-container fluid>
        <v-card>
            <v-card-title>Twitch Settings</v-card-title>
            <v-divider></v-divider>
            <v-card-text>
                <v-row>
                    <v-col cols="6" md="6">
                        <v-text-field hint="Takes effect after restarting the twitch bot" label="Twitch Channel" v-model="temp.channel_name" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="4" md="4">
                        <v-checkbox label="Show message in-game" v-model="temp.show_user_msg">
                        </v-checkbox>
                    </v-col>
                </v-row>
            </v-card-text>
            <v-divider></v-divider>
            <v-card-title>
                <span class="title">Highlighted Messages</span>
                <v-checkbox v-model="temp['highlighted-message'].enabled">
                </v-checkbox>
            </v-card-title>
            <v-divider></v-divider>

            <v-card-text v-if="temp['highlighted-message'].enabled">
                <v-row>
                    <v-col cols="6" md="6" >
                        <v-textarea label="Comment" v-model="temp['highlighted-message'].comment" outlined>
                        </v-textarea>
                    </v-col>
                    <v-col cols="6" md="6" >
                        <v-textarea label="Function" v-model="temp['highlighted-message'].func" outlined>
                        </v-textarea>
                    </v-col>
                </v-row>
            </v-card-text>

            <v-divider></v-divider>
            <v-card-title>Custom Rewards</v-card-title>
            <v-divider></v-divider>
            <v-card-text>
                <v-row v-for="id in rewards" :key="id">
                    <template v-if="typeof temp['custom-rewards'][id] != 'undefined'">
                    <v-col cols="12" md="12">
                        <span class="subtitle-2">
                            <v-btn @click="rmReward(id)" icon large class="ma-0"><v-icon>mdi-delete</v-icon></v-btn>
                            id: {{id}}
                        </span>
                    </v-col>
                    <v-col cols="8" md="8">
                        <v-text-field label="Reward Name" v-model="temp['custom-rewards'][id].name" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="4" md="4">
                        <v-checkbox label="Enabled" v-model="temp['custom-rewards'][id].enabled">
                        </v-checkbox>
                    </v-col>
                    <v-col cols="6" md="6">
                        <v-text-field label="Message Header" v-model="temp['custom-rewards'][id].msg_head" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="6" md="6">
                        <v-text-field label="Message Body" v-model="temp['custom-rewards'][id].msg_body" outlined>
                        </v-text-field>
                    </v-col>
                    <v-col cols="6" md="6" >
                        <v-textarea label="Comment" v-model="temp['custom-rewards'][id].comment" outlined>
                        </v-textarea>
                    </v-col>
                    <v-col cols="6" md="6">
                        <v-textarea label="Function" v-model="temp['custom-rewards'][id].func" outlined>
                        </v-textarea>
                    </v-col>
                    <v-col cols="12" md="12">
                    <v-divider></v-divider>
                    </v-col>
                    </template>
                </v-row>
            </v-card-text>
            <v-divider></v-divider>
            <v-col cols="12" md="12">
                <v-text-field label="Add Reward" hint="Reward id from the console: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                v-model="tempId" @keypress.enter="addReward(tempId)">
                    <template v-slot:append>
                        <v-btn depressed tile class="ma-0" @click="addReward(tempId)">Add</v-btn>
                    </template>
                </v-text-field>
            </v-col>
            <v-card-actions>
                    <v-row align="center" justify="center">
                        <v-btn @click="apply()">Apply</v-btn> <v-btn @click="tempModel()">Cancel</v-btn>
                    </v-row>
            </v-card-actions>
        </v-card>
    </v-container>
    `
})

Vue.component("comp-misc", {
    data: function(){
        return {
            plusTime: 0,
            minusTime: 0
        }
    },
    methods: {
        addTime(val) {
            if (isNaN(val)) {
                return
            }
            axios.post("/misc/timeleft", {val: Math.floor(val)})
        },
        rmTime(val) {
            if (isNaN(val)) {
                return
            }
            axios.post("/misc/timeleft", {val: Math.floor(val - val*2)})
        },
        reloadOutcomes(val) {
            axios.post("/misc/reload_outcomes", {})
        },
        isNumber(val) {
            if (typeof val == "number") {
                return true
            }
            else {
                return "Not a number"
            }
        }
    },
    template: `<div>
    <v-container fluid>
        <v-card>
            <v-card-title>Misc Things</v-card-title>
            <v-divider></v-divider>
            <v-card-text>
                <v-row>
                    <v-col cols="6" md="6">
                        <v-text-field label="Increase time" v-model.number="plusTime"
                        :rules="[isNumber]" @keypress.enter="addTime(plusTime)">
                            <template v-slot:append>
                                <v-btn depressed tile @click="addTime(plusTime)">Send</v-btn>
                            </template>
                        </v-text-field>
                    </v-col>
                    <v-col cols="6" md="6">
                        <v-text-field label="Decrease timer" v-model.number="minusTime"
                        :rules="[isNumber]" @keypress.enter="rmTime(minusTime)">
                            <template v-slot:append>
                                <v-btn depressed tile @click="rmTime(minusTime)">Send</v-btn>
                            </template>
                        </v-text-field>
                    </v-col>
                    <v-divider></v-divider>
                    <v-col cols="4" md="4">
                        <v-btn @click="reloadOutcomes()">Reload Outcomes</v-btn>
                    </v-col>
                </v-row>
            </v-card-text>
        </v-card>
    </v-container>
    </div>`
})

let vm = new Vue({
    el: '#app',
    vuetify: new Vuetify(),
    data: {
        tab: "outcomes",
        models: {
            outcomes: {},
            twitch: {},
            noita: {},
            obs_template: {},
            misc: {}
        }
    },
    beforeCreate: async function () {
        this.$vuetify.theme.dark = true

        let outcomes = await axios.get("/outcomes")
        this.$set(this.models, "outcomes", outcomes.data)

        let twitch = await axios.get("/twitch")
        this.$set(this.models, "twitch", twitch.data)

        let noita = await axios.get("/noita")
        this.$set(this.models, "noita", noita.data)
    }
})