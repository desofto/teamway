import Vue from 'vue'
import App from '../app.vue'

import VueResource from "vue-resource"
Vue.use(VueResource)

document.addEventListener('DOMContentLoaded', () => {
  let tokenElement = document.querySelector('meta[name="csrf-token"]')
  if (tokenElement) Vue.http.headers.common['X-CSRF-TOKEN'] = tokenElement.getAttribute("content")

  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})