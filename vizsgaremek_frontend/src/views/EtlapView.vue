<template>
  <div class="etlap mt-5 mt-lg-0">
    <div class="bg_light_green text_dark_green mt-5">
      <div class="container-fluid p-0 p-md-5">

        <div class="container mx-auto p-xl-5">
          <h1 class="text-center text-1 ff_comfortaa ">Heti kedvencek</h1>
          <div class="row mx-0 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-3">
            <div v-for="favProduct in favProducts" v-bind:key="favProducts.prId" class="">
              <PizzaFav :pizzaFav=favProduct />
            </div>
          </div>
        </div>

      </div>
    </div>
    <div class="position-relative ff_comfortaa  bg_light_green text_dark_green lg_shadow">
      <router-link to="/pizza-hozzaadasa" id="pizzaAdminBtn" v-if="jog >= 8"
        class="position-absolute btn btn-sm btn-primary mt-5"><svg xmlns="http://www.w3.org/2000/svg" width="16"
          height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
          <path
            d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
        </svg> Új pizza</router-link>
      <div class="container mx-auto p-xl-5">
        <h2 class="text-center text-2 mb-5 pt-5">Pizzáink</h2>

        <div class="album py-5 bg-body-tertiary">
          <div class="container">

            <div class="row mx-0  row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-3 equal-height">


              <div v-for="product in this.$store.state.products" v-bind:key="this.$store.state.products.prId" class="col">
                <Pizza :pizza=product :jog=this.jog />
              </div>

            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Pizza from '@/components/Pizza.vue';
import PizzaFav from '@/components/PizzaFav.vue';

export default {
  name: 'EtlapView',
  components: {
    Pizza,
    PizzaFav
  },
  data() {
    return {
      productId: "",
      logged: this.$store.state.logged,
      jog: this.$store.state.jogosultsag,
      //products: this.$store.state.products,
      favProducts: []
    };
  },

  methods: {
    pizzakBeolvasasa() {
      let url = "https://localhost:5001/Product";
      axios
        .get(url)
        .then((response) => {
          this.$store.state.products = response.data;
          for (let i = 0; i < 4; i++) {
            this.favProducts.push(this.$store.state.products[i+i*2]);
          }


        })
        .catch((error) => {
          alert("Beolvasás nem sikerült!\nHiba: " + error.message);
        });
    }
  },
  mounted: function () {
    this.pizzakBeolvasasa();
  },
}
</script>
<style>
#pizzaAdminBtn {
  right: 0.5rem;
}
</style>