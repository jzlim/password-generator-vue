<template>
    <v-container text-center>
        <h1
            class="py-5 mx-auto password"
            v-if="!isLoading"
        >{{generatedPassword}}</h1>
        <v-progress-circular
            indeterminate
            color="primary"
            v-else
        ></v-progress-circular>
        <v-row>
            <v-col cols="12" class="custom-width">
                <v-col>
                    <v-slider
                        v-model="passwordLength"
                        thumb-label
                        min="1"
                        max="30"
                    ></v-slider>
                </v-col>
                <v-col>
                    <div class="">
                        <v-checkbox
                            v-model="includeUpperCase"
                            label="Includes Uppercase Character"
                        ></v-checkbox>
                    </div>
                </v-col>
                <v-col>
                    <div class="">
                        <v-checkbox
                            v-model="includeNumber"
                            label="Includes Number Character"
                        ></v-checkbox>
                    </div>
                </v-col>
                <v-col>
                    <div class="">
                        <v-checkbox
                            v-model="includeSymbol"
                            label="Includes Symbol Character"
                        ></v-checkbox>
                    </div>
                </v-col>
            </v-col>
        </v-row>
        <v-btn
            block
            dark
            x-large
            @click="generatePassword()"
        >Generate</v-btn>
    </v-container>
</template>

<script>
export default {
    data: () => ({
        isLoading: false,
        generatedPassword: 'GeneratedPassword',
        passwordLength: 10,
        includeUpperCase: false,
        includeNumber: false,
        includeSymbol: false
    }),
    methods: {
        generatePassword() {
            if (!this.passwordLength) return
            this.triggerLoading(true)

            let password = ""
            let characters = "abcdefghijklmnopqrstuvwxyz"
            if (this.includeUpperCase) characters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            if (this.includeNumber) characters += "0123456789"
            if (this.includeSymbol) characters += "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"

            for (let i = 0; i < this.passwordLength; i++) {
                password += characters.charAt(Math.floor(Math.random() * characters.length))
            }

            this.generatedPassword = password
            this.triggerLoading(false)
        },
        triggerLoading(state) {
            this.isLoading = state
        }
    }
}
</script>

<style scoped>
.password {
    overflow-wrap: break-word;
}
</style>
