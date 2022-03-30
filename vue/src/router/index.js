import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/views/Login'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Login',
    component: Login
  },
  {
    path: '/home',
    name: 'Home',
    component: () => import('@/views/Home.vue')
  },
  {
    path: '/it/create',
    name: 'ItCreate',
    component: () => import('@/views/it/Anketa.vue')
 },
  {
    path: '/it',
    name: 'ItList',
    component: () => import('@/views/it/Saraksts.vue')
  },
  {
    path: '/it/view',
    name: 'ItView',
    component: () => import('@/views/it/View.vue')
  },
  {
    path: '/itAdminVec/fixer',
    name: 'ItFixer',
    component: () => import('@/views/it/Fixer.vue')
  },
  {
    path: '/itAdmin',
    name: 'ItList2',
    component: () => import('@/views/it/SarakstsAdmin.vue')
  },
  {
    path: '/itAdminVec',
    name: 'ItList3',
    component: () => import('@/views/it/SarakstsAdminVec')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
