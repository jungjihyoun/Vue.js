<template>
  <div id="app">
    <Header></Header>
    <div class="content" id="content">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import Header from './components/layout/Header.vue';

export default {
  name: 'App',
  components: {
    Header,
  },
};
</script>

<style>
</style>
