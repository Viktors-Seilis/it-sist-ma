<template>
  <b-container>
    <b-row>
      <b-col cols="8" class="mx-auto">
        <b-card class="login"
                header="Pieslēgšanās logs"
        >
            <b-button type="submit" variant="success" class="w-100" @click="Login">Lai pieslēgtos ar darba epastu, klišķis šeit</b-button>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from 'vuex';

export default {
  data() {
    return {
      form: {
        email: '',
        password: '',
      },
      user: null,
    }
  },
  computed: {
    ...mapGetters ({
      User: "Auth/user",
    })
  },
  methods: {
    ...mapActions ({
      Login: "Auth/login",
    }),
  },
  mounted() {
    if(this.User) {
      this.$router.push({ name: 'Home' })
    }
  }
}
</script>

<style lang="scss">
  .card {
    margin-top: 50px;
    margin-bottom: 50px;
    border: 0px;
    .card-header {
      background-color: #9f2720;
      color: white;
    }
    footer.card-footer {
      background: #28a745;
      padding: 0px;
      height: 5px;
    }
  }
</style>