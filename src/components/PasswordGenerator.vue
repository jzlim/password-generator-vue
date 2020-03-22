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
                        min="6"
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
        includeSymbol: false,

        lowerCaseCharCodes: [],
        upperCaseCharCodes: [],
        numberCharCodes: [],
        symbolCharCodes: []
    }),
    created() {
        this.lowerCaseCharCodes = this.getCharacterCodesFromRange(97, 122)
        this.upperCaseCharCodes = this.getCharacterCodesFromRange(65, 90)
        this.numberCharCodes = this.getCharacterCodesFromRange(48, 57)
        this.symbolCharCodes = [...this.getCharacterCodesFromRange(33, 47),
                                ...this.getCharacterCodesFromRange(58, 64),
                                ...this.getCharacterCodesFromRange(91, 96),
                                ...this.getCharacterCodesFromRange(123, 126)]        
    },
    methods: {
        testMethod: () => console.log('test'),
        getCharacterCodesFromRange(start, end) {
            // https://www.petefreitag.com/cheatsheets/ascii-codes/
            const char = []
            for (let i = start; i <= end; i++) {
            char.push(i)
            }
            return char
        },
        generatePassword() {
            if (!this.passwordLength) return
            this.triggerLoading(true)

            let passwordCharArray = []
            let charCodes = this.lowerCaseCharCodes
            if (this.includeUpperCase) charCodes = [...charCodes, ...this.upperCaseCharCodes]
            if (this.includeNumber) charCodes = [...charCodes, ...this.numberCharCodes]
            if (this.includeSymbol) charCodes = [ ...charCodes, ...this.symbolCharCodes]

            for (let i = 0; i <= this.passwordLength; i++) {
                const characterCode = charCodes[Math.floor(Math.random() * charCodes.length)]
                passwordCharArray.push(String.fromCharCode(characterCode))
            }
            this.generatedPassword = passwordCharArray.join('')
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