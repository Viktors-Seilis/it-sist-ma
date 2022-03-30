
export default {
    namespaced: true,

    state: {
        options: null,
    },
    getters: {
        options (state) {
            return state.options;
        },
    },
    mutations: {
        SET_OPTIONS(state, value) {
            state.options = value;
        },
    },
    actions: {
        async fetchOptions({commit}) {
            await axios.get('/options').then(response => {
                commit('SET_OPTIONS', response.data.data)
            })
        },
    }
}