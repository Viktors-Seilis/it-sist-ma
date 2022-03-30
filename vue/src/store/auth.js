import router from '../router/index' // Vue router instance
import auth from '@/services/auth'
import graph from '@/services/graph'

export default {
    namespaced: true,

    state: {
        user: null,
    },
    getters: {
        user (state) {
            return state.user;
        },
    },
    mutations: {
        SET_USER(state, value) {
            state.user = value;
            localStorage.setItem('user', JSON.stringify(value));
        },
    },
    actions: {
        async login({commit, state, dispatch}, data) {
            await auth.login(['user.read'])
            await graph.getSelf()

            await axios.post('/login', {
                'access_token': graph.getAccessToken()
            }).then(response => {
                let data = response.data.data
                if(data.token) {
                    data.roles.forEach(e => {
                        if(e != 'Skolotājs' && e != 'Lasītājs') {
                            data.isAdmin = true;
                            return false;
                        } else {
                            data.isAdmin = false;
                        }
                    })

                    commit('SET_USER', data);
                    axios.defaults.headers.common['Authorization'] = `Bearer ${data.token}`;
                    router.push({ name: 'Home' })
                }
            }).catch(e => {
                console.error(e);
            });
        },
        async checkToken({commit, state}) {
            let user = JSON.parse(localStorage.getItem('user'))
            console.log(user);
            if(user) {
                axios.defaults.headers.common['Authorization'] = `Bearer ${user.token}`;
                await axios.get('/me').then(response => {
                    let data = response.data.data;
                    data.token = user.token;
                    if(response.data) {
                        user.roles = data.roles
                        data.roles.forEach(e => {
                            if(e != 'Skolotājs' && e != 'Lasītājs') {
                                data.isAdmin = true;
                                return false;
                            } else {
                                console.log(data);
                                data.isAdmin = false;
                            }
                        })
                        commit('SET_USER', data);
                    }
                }).catch(e => {
                    console.error(e);
                    if(router.currentRoute.name != 'Login') {
                        router.push({ name: 'Login' })
                    }
                })
            } else if(router.currentRoute.name != 'Login') {
                router.push({ name: 'Login' })
            }
        },
        async logout({commit}) {
            await axios.get('/logout').then(response => {
                if(response.data) {
                    axios.defaults.headers.common['Authorization'] = null;
                    commit('SET_USER', null)
                    localStorage.setItem('user', null)
                    router.push({ name: 'Login' })
                }
            }).catch(e => {
                console.error(e);
                if(router.currentRoute.name != 'Login') {
                    router.push({ name: 'Login' })
                }
            })
        }
    }
}