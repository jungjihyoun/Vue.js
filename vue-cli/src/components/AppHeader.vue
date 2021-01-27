<template>
  <header>
      <h1>{{propsdata}}</h1>
      <button v-on:click="sendEvent">send</button>
  </header>

</template>

<script>
export default {
    props: ['propsdata'],
    methods:{
        sendEvent: function(){
            this.$emit('renew');
            //위쪽 컴포넌트로 전달 
        }
    }

}
</script>

<style>

</style>