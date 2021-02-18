import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import mixins from './mixins'
import store from './store'

import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'



createApp(App).use(router).mixin(mixins).use(store).mount('#app')





window.Kakao.init("0639d847c4f64416daa27dc3d52be2c4");
