<template>
  <div>

      <!-- data를 바인딩 한다 : v-model -->
      <!-- 이벤트를 건다 : @ -->
      <!-- 다중 데이터 핸들링 : v-for -->
      <!-- 조건에 따라 데이터를 렌더링 할 지 말지 정함 (아예 렌더링 자체를 안해) : v-if -->
      <!-- 렌더링은 무조건 하지만 실제 화면에만 보여주지 않음 : v-show -->
      <h1> Index of {{title}} ! </h1>

      <hr class = "hr">
      <p>Input your city</p>
      <input type="text" v-model = "input1"/>
      <button type="button" @click="getData">Get</button>
      <button type="button" @click="setData">Set</button>
      <select class="form-control" v-model="region" @change="changeRegion">
          <option :key="index" :value="data.t" v-for="(data,index) in options">{{data.t}}</option>
      </select>
      <table class="table table-bordered" v-if="tableShow">
          <tr :key="index" v-for="(data,index) in options">
              <td> {{data.v}}</td>
              <td> {{data.t}}</td>
          </tr>
      </table>
      <div>
        <button class="button btn-primary" @click="addRow">Add row</button>
      </div>
  </div>
</template>

<script>
// import Header from '../components/layout/Header.vue'
export default {
    data(){
        return {
            title: "City",
            title2: "Busan",
            input1: "city",
            input2: "alpha",
            options:[
                {v:"S", t:"Seoul"},
                {v:"J", t:"Jeju"},
                {v:"B", t:"Busan"},
            ],
            region: "select user's city",
            tableShow: true,
        };
    },
    watch:{
        // 특정데이터를 모니터링 하고 있다가 바뀔 때마다 콘솔에 보여줄 수 있다
        // 변수명과 동일한 함수로 만들면 된다
        input1(){
            console.log(this.input1);
        },
    },
 methods: {
    getData() {
      alert(this.input1);
    },
    setData() {
      this.input1 = "12345";
    },
    changeRegion() {
      alert(this.region);
    },
    addRow(){
        this.options.push({
            v: this.input1[0].toUpperCase(),
            t: this.input1,
        });
     },
 },
  beforeCreate() {
    console.log("beforeCreate");
  },
  created() {
    console.log("created");
  },
  beforeMount() {
    console.log("beforeMount");
  },
  mounted() {
    console.log("mounted");
  },
  beforeUpdate() {
    console.log("beforeUpdate");
  },
  updated() {
    console.log("updated");
  },
  beforeDestroy() {
    console.log("beforeDestroy");
  },
  destroyed() {
    console.log("beforeDestroy");
  },
};
</script>

<style>

p{
    size: 50px;
    font-weight: bolder;
    color: blueviolet;
}

.hr{
    border: 2px dotted lightblue;
}
</style>