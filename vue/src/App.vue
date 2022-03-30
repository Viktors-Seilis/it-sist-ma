<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="dark">

      <b-navbar-brand href="#"><img src="/images/logo.webp" alt="Rīgas Valsts tehnikums" width="100%" id="logo"></b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav v-if="User">
        <b-navbar-nav>
          <b-nav-item :to="{ name: 'Home' }">Sākums</b-nav-item>
          <b-nav-item :to="{ name: 'ItList' }">Manas problēmas</b-nav-item>
          <b-nav-item :to="{ name: 'ItList2' }">Administratora skats</b-nav-item>
          <b-nav-item :to="{ name: 'ItList3' }">Vecākā administrātora skats</b-nav-item>
        <b-navbar-nav class="ml-auto">
          <b-nav-item-dropdown right :text="User.name+' '+User.surname">
            <b-dropdown-item @click="logout()">Atslēgties</b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>

    <router-view :key="$route.path"></router-view>

    <div class="footer">
      © PIKC "Rīgas Valsts tehnikums" {{ new Date().getFullYear() }}
    </div>
  </div>
</template>
<script>
import {mapActions, mapGetters} from "vuex";
import auth from '@/services/auth'

export default {
  computed: {
    ...mapGetters ({
      User: "Auth/user",
    })
  },
  methods: {
    ...mapActions ({
      logout: "Auth/logout",
    }),
    getUser() {

    }
  },
  created() {
    if (process.env.VUE_APP_CLIENT_ID) {
      auth.configure(process.env.VUE_APP_CLIENT_ID, false)
    } else {
      this.error = 'VUE_APP_CLIENT_ID is not set, the app will not function! 😥'
    }
  },
}
</script>
<style lang="scss">
body {
  width: 100%;
  height: 100%;
  background-image: url("/images/background.webp");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
}
#logo {
  max-width: 40px;
}
nav.navbar.navbar-dark.navbar-expand-lg {
  padding: 0px;
}
.footer {
  position: fixed;
  bottom: 0;
  background-color: #343a40;
  width: 100%;
  height: 50px;
  margin-top: 70px;
  color: rgba(255,255,255,.5);
  text-align: right;
  padding-right: 20px;
  line-height: 50px;
  z-index: 1;
}
</style>
