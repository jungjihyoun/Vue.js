<template>
<main class="mt-3">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <!-- carousel 수정  -->
                    <div id="carouselExampleIndicators" class="carousel carousel-dark slide" data-bs-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
                        </ol> 
                        <div class="carousel-inner"> 
                           <div :class="`carousel-item ${i==0?'active':''}`" :key="i" v-for="(pimg, i) in productImage">
                          <img :src="`/download/${productId}/${pimg.path}`" class="d-block w-100" alt="...">
                        </div>
                     
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </a>
                    </div>

                </div>
                <div class="col-md-7">

                    <!-- 우측 제품 설명  -->
                    <div class="card shadow-sm">

                        <div class="card-body">
                            <h5 class="card-title"> Baby Apeach </h5>
                            <h5 class="card-title pt-3 pb-3 border-top"> <del>52,000 won</del><strong><mark>48,000 won</mark></strong></h5>
                            <p class="card-text border-top pt-3 ">
                                <span class="badge bg-danger">Hot</span>
                                <span class="badge bg-primary">Sale</span>
                            </p>
                            <!-- 배송 설명 -->
                            <p class="card-text pb-3">
                                shipping charge 2,500 won | parcel (delivery) service | no charge for more than 50,000
                                won
                            </p>
                            <!-- 총 수량 -->
                            <div class="card-text  border-top pb-3">
                            <div class="row">
                                <div class="col-auto">
                                    <label class="col-form=label"> Quantity </label>
                                </div>
                                <div class="col-auto">
                                    <div class="input-group">
                                        <span class="input-group-text">-</span>
                                        <input type="text" class="form-control" style="width:40px;" value="1">
                                        <span class="input-group-text">+</span>
                                    </div>

                                </div>
                            </div>
                            </div>
                            <!-- 총 가격 -->
                            <div class="row pt-3 pb-3 border-top">
                                <div class="col-6">
                                    <h3> COST </h3>
                                </div>
                                <div class="col-6" style="text-align: right;">
                                    <h3>48,000 won</h3>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-item-center">

                                <div class="col-6 d-grid p-1">
                                    <button type="button" class="btn btn-lg  btn-dark">Cart</button>

                                </div>
                                <div class="col-6 d-grid p-1">
                                    <button type="button" class="btn btn-lg  btn-danger">Purchase</button>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <img src="img/1/detail1.png"
                        class="img-fluid" />
                </div>
            </div>
        </div>
    </main>
</template>

<script>
export default{
    data(){
        return {
            productID: 0,
            productDetail: {},
            productImage: [],
        }
    },
    created(){
        this.productId = this.$route.query.product_id;
        this.getProductDetail();
        this.getProductImage();
    },
    methods: {
        async getProductDetail(){                 //mixin url
            this.productDetail = await this.$api("/api/productDetail",{param:[this.productID]});
            console.log(this.productDetail);
        },
        async getProductImage(){
          this.productImgae = await this.$api("/api/productMainImages", {param:[this.productId]});
          console.log("imageList",this.productImage)
        }
    
    }
}

</script>
