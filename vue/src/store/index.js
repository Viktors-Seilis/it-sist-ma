import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import Auth from './auth'
import Options from './options'

export default new Vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    Auth,
    Options,
  }
})