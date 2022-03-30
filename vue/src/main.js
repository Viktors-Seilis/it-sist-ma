import '@babel/polyfill'
import 'mutationobserver-shim'
import Vue from 'vue'
import './plugins/bootstrap-vue'
import './plugins/axios'
import App from './App.vue'
import router from './router'
import store from './store'
import './mixins/permissions'
import Vuelidate from 'vuelidate'
import { BootstrapVueIcons } from 'bootstrap-vue'

Vue.use(BootstrapVueIcons)
Vue.use(Vuelidate)


Vue.config.productionTip = false
Vue.config.devtools = false

Vue.directive('can', {
  bind: function (el, binding, vnode) {
    let perm = binding.expression.substring(1, binding.expression.length-1);
    if(!store.getters["Auth/user"].permissions.find(e => e.name === perm)) {
      vnode.elm.style.display = "none";
    }
  }
})

store.dispatch('Auth/checkToken').then(() => {

  new Vue({
    router,
    store,
    render: h => h(App)
  }).$mount('#app')
});