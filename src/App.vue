<template>
  <div id="app">
    <v-app id="inspire">
      <Bar />
      <v-content>
        <PasswordGenerator />
      </v-content>
      <Footer />
    </v-app>
  </div>
</template>

<script>
import Bar from './components/Bar';
import Footer from './components/Footer';
import PasswordGenerator from './components/PasswordGenerator';

export default {
  name: 'App',

  components: {
    Bar,
    Footer,
    PasswordGenerator,
  },

  data: () => ({
    //
  }),
};
</script>
