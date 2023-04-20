<template>
  <div class="home">
    <div class="bg_light_green text_dark_green mt-5">
      <div class="container-fluid p-5">
        <h1 class="text-center text-1 ff_comfortaa">Heti kedvencek</h1>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          <div v-for="favProduct in favProducts" v-bind:key="favProducts.prId" class="col">
            <div class="card shadow-sm">
              <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                role="img" aria-label="Placeholder: {{ favProduct.prName }}" preserveAspectRatio="xMidYMid slice"
                focusable="false">
                <title>Placeholder</title>
                <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef" dy=".3em">{{
                  favProduct.prName }}</text>
              </svg>
              <div class="card-body">
                <div class="card-text">
                  <table class="table table-striped helpyou_table text_dark_green">
                    <tbody>
                      <tr>
                        <td>Összetevők:</td>
                        <td>{{ favProduct.prOther }}</td>
                      </tr>
                      <tr>
                        <td>Ár:</td>
                        <td>{{ favProduct.prPrice }}</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class=" position-relative ff_comfortaa bg_light_green text_dark_green lg_shadow">
      <div class="container mx-auto p-xl-5">
        <h2 class="text-center text-2 mb-5 pt-5">Pizzáink</h2>

        <div class="album py-5 bg-body-tertiary">
          <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">


              <div v-for="product in products" v-bind:key="products.prId" class="col">
                <div class="card shadow-sm">
                  <input type="hidden" v-model="productId">
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
                        <button type="button" class="btn btn-sm btn-outline-secondary" @click="modifyClick(product)"><svg
                            xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-pencil" viewBox="0 0 16 16">
                            <path
                              d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                          </svg> Módosítás</button>
                        <button type="button" class="btn btn-sm btn-outline-danger" @click="deleteClick(product)"><svg
                            xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-trash" viewBox="0 0 16 16">
                            <path
                              d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
                            <path
                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
                          </svg> Törlés</button>
                      </div>
                      <button type="button" class="btn btn-sm btn-primary"><svg xmlns="http://www.w3.org/2000/svg"
                          width="16" height="16" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
                          <path
                            d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
                        </svg> Kosárba</button>
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
    deleteClick(product) {
      if (confirm('Biztosan törölni akarja ezt a pizzát?\nID: ' + product.prId + '\nNév: ' + product.prName)) {
        let url = "https://localhost:5001/Product/" + product.prId;
        axios
          .delete(url)
          .then((response) => {
            if (response.status == 200) {
              alert(response.data);
              location.reload()
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