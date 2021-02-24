<template>
  <div>
    <!-- Main -->
    <!-- 상단 필터 -->
    <main class="mt-3">
        <div class="container">
            <div class="row mb-2">
                <div class="col-12">
                    <select class="form-select">
                        <option selected>Open this select menu</option>
                        <option value="1">최신순 </option>
                        <option value="2">판매량순</option>
                        <option value="3">낮은 가격순</option>
                        <option value="4">높은 가격순</option>
                    </select>
                </div>
            </div>

            <!-- 제품 -->
            <div class="row g-3" >
                <div class="col-xl-3 col-lg-4 col-md-5"  :key="i" v-for="(product,i) in productList">
                    <div class="card" style="width: 18rem;">
                        <a @click="goToDetail(product.id);" style="cursor:pointer;"><img :src="`/download/${product.id}/${product.path}`" class="card-img-top" alt="..."></a>
                        <div class="card-body">
                            <h5 class="card-title"> {{product.product_name}} </h5>
                            <p class="card-text">
                                <span class="badge bg-danger text-white mr-1" >Hot</span>
                            </p>
                            <div class="d-flex justify-content-between align-item-center">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-md  btn-outline-primary">Cart</button>
                                    <button type="button" class="btn btn-md  btn-outline-primary">Purchase</button>
                                </div>
                                <small class="text-dark"> {{product.product_price}}won</small>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
  </div>

    
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


