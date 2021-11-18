import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import KittensIndex from '../views/KittensIndex.vue'
import KittensNew from '../views/KittensNew.vue'
import KittensShow from '../views/KittensShow.vue'
import KittensEdit from '../views/KittensEdit.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: "/kittens",
    name: "kittens-index",
    component: KittensIndex
  },
  {
    path: "/kittens/new",
    name: "kittens-new",
    component: KittensNew 
  },
  {
    path: "/kittens/:id",
    name: "kittens-show",
    component: KittensShow
  },
  {
    path: "/kittens/:id/edit",
    name: "kittens-edit", 
    component: KittensEdit
  }

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
