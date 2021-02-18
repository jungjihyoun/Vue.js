<template>

    <main class="mt-3">
      <div class = "container">
          <table class="table table-bordered">
        <thead>
          <tr>
           
           
            <th>제품명</th>
            <th>제품가격</th>
            <th>배송비</th>
            <th>추가 배송비</th>
            <th> </th>
           
          </tr>
        </thead>
        <tbody>
          <tr :key="i" v-for="(product, i) in productList">
            
            <td>{{product.product_name}}</td>
            <td>{{product.product_price}}</td>
            <td>{{product.delivery_price}}</td>
            <td>{{product.add_delivery_price}}</td>
            <td>
              <button type="button" class="btn btn-info me-1">사진등록</button>
              <button type="button" class="btn btn-warning me-1">수정</button>
              <button type="button" class="btn btn-danger me-1">삭제</button>
              </td>
          
            
          </tr>
        </tbody>
      </table>
      </div>
    
    </main>


</template>


<script>
export default {
  data() {
    return {
      productList: []
    };
  },
  created() {
    this.getProductList();
  },
  methods: {
    async getProductList() {
      this.productList = await this.$api("/api/productList",{});
      console.log("productList ->", this.productList);
    },
    goToDetail(product_id) {
     this.$router.push({path:'/detail', query:{product_id:product_id}}); 
    }
  }
}
</script>


