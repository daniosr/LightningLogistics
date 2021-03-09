import Vue from 'vue'
import App from './App.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'axios'
import VueCookies from 'vue-cookies';
import router from './router'

Vue.config.productionTip = false
Vue.use(VueCookies)
Vue.$cookies.config('30d')

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
