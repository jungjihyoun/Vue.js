import {createStore} from 'vuex'

import persistedstate from 'vuex-persistedstate';


const store = createStore({
  state(){
    return {
      user:{}
    }
  },
  mutations: {
    user(state, data){
      state.user = data;
    }
  },
  //새로고침시 user state 날라가지 않음 
  plugins: [
    persistedstate({
      paths: ['user']
    })
  ]
});

export default store;