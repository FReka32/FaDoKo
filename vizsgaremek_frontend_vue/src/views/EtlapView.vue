<template>
  <div class="etlap">
    <div class="bg_light_green text_dark_green mt-5">
      <div class="container-fluid p-5">
        <h1 class="text-center text-1 ff_comfortaa">Heti kedvencek</h1>
        <div class="row mx-0 row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          <div v-for="favProduct in favProducts" v-bind:key="favProducts.prId" class="">
            <div class="card shadow-sm">
              <img class="img-fluid" :src="'data:image/jpeg;base64,' + favProduct.prUrl" width="500" height="225">
              <div class="card-body">
                <div class="card-text">
                  <p class="mb-3 h5">{{ favProduct.prName }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="position-relative ff_comfortaa bg_light_green text_dark_green lg_shadow">
      <router-link to="/pizza-hozzaadasa" id="pizzaAdminBtn" v-if="jog == 9" class="position-absolute btn btn-sm btn-primary mt-5"><svg
          xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle"
          viewBox="0 0 16 16">
          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
          <path
            d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
        </svg> Új pizza hozzáadása</router-link>
      <div class="container mx-auto p-xl-5">
        <h2 class="text-center text-2 mb-5 pt-5">Pizzáink</h2>

        <div class="album py-5 bg-body-tertiary">
          <div class="container">

            <div class="row mx-0 row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">


              <div v-for="product in products" v-bind:key="products.prId" class="col">
                <div class="card shadow-sm">
                  <img class="img-fluid" :src="'data:image/jpeg;base64,' + product.prUrl" width="500" height="225">
                  <div class="card-body">
                    <div class="card-text">
                      <p class="mb-3 h5">{{ product.prName }}</p>
                      <p class="mb-1">Összetevők:</p>
                      <p class="mb-3">{{ product.prOther }}</p>

                      <p class="mb-1">Méret kiválasztása</p>
                      <div class="mb-3 d-flex">
                        <div v-for="size in product.prSize" class="form-radio pe-4">
                          <input class="form-radio-input" type="radio" name="size" value="{{ size }}" id="{{ size }}">
                          <label class="form-radio-label" for="{{ size }}">
                            {{ size }}
                          </label>
                        </div>
                      </div>


                      <p class="mb-1">Ár:</p>
                      <p class="mb-3">{{ product.prPrice }}</p>


                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                      <div v-if="jog == 9" class="btn-group">
                        <router-link class="btn btn-sm btn-outline-primary" to="/pizza-modositasa" @click="modifyClick(product.prId)"><svg
                            xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-pencil" viewBox="0 0 16 16">
                            <path
                              d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                          </svg> Módosítás</router-link>
                        <button type="button" class="btn btn-sm btn-outline-danger" @click="deleteClick(product)"><svg
                            xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-trash" viewBox="0 0 16 16">
                            <path
                              d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
                            <path
                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
                          </svg> Törlés</button>
                      </div>
                    </div>
                  </div>
                </div>
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

export default {
  name: 'EtlapView',
  components: {
  },
  data() {
    return {
      productId: "",
      logged: this.$store.state.logged,
      jog: this.$store.state.jogosultsag,
      products: [],
      favProducts: []
    };
  },

  methods: {
    closeClick() {
      this.$router.push("/");
    },
    pizzakBeolvasasa() {
      let url = "https://localhost:5001/Product";
      axios
        .get(url)
        .then((response) => {
          this.products = response.data;
          //console.log(this.products);
          for (let i = 0; i < 3; i++) {
            this.favProducts.push(this.products[i]);
          }
          for (let i = 0; i < this.products.length; i++) {
            this.products[i].prSize = JSON.parse(this.products[i].prSize);
          }


        })
        .catch((error) => {
          //alert(error);
        });
    },
    modifyClick(id) {
      this.$store.state.productId = id;
    },
    deleteClick(product) {
      if (confirm('Biztosan törölni akarja ezt a pizzát?\nID: ' + product.prId + '\nNév: ' + product.prName)) {
        let url = "https://localhost:5001/Product/" + product.prId;
        axios
          .delete(url)
          .then((response) => {
            if (response.status == 200) {
              alert(response.data);
              this.pizzakBeolvasasa();
            } else {
              //alert(response.data);
            }
          })
          .catch((error) => {
            //console.log(error);
          });
      } else {
        // Do nothing!
      }

    },
  },
  mounted: function () {
    this.pizzakBeolvasasa();
  },
}
</script>
<style>
#pizzaAdminBtn{
  right: 3rem;
}
</style>