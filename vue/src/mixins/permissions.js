import store from "../store";
import Vue from "vue";

Vue.mixin({
    methods: {
        hasPermission(str) {
            return store.getters["Auth/user"].permissions.find(e => e.name === str);
        }
    }
})