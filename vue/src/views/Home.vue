<template>
  <b-container>
    <b-row>
      <b-col cols="12">
        <b-card
            header="Personāldaļa"
            header-tag="header"
            footer-tag="footer"
            footer=" "
        >
          <b-card-text>
            Esi sveicināts/a {{ User.name }} {{ User.surname }} <br>
            <span v-if="User.roles">Jūsu sistēmas lomas ir: {{ getRoleNames() }}</span>
          </b-card-text>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Home",
  computed: {
    ...mapGetters ({
      User: "Auth/user",
    })
  },
  methods: {
    getRoleNames() {
      let names = "";
      this.User.roles.forEach((e, i) => {
        if(i != this.User.roles.length-1) {
          names += e+', ';
        } else {
          names += e;
        }
      })

      return names;
    },
  },
}
</script>

<style lang="scss" scoped>

</style>