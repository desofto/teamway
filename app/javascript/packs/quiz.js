import Vue from 'vue'
import App from '../app.vue'

import VueResource from "vue-resource"
Vue.use(VueResource)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})