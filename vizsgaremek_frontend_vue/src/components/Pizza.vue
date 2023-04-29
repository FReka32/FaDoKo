<template>
    <div class="card shadow-sm h-100">
        <img class="img-fluid" :src="'data:image/jpeg;base64,' + pizza.prUrl" width="500" height="225">
        <div class="card-body">
            <div class="card-text d-flex flex-column h-100 justify-content-between">
                <div>
                    <p class="mb-3 h5">{{ pizza.prName }}</p>
                    <p class="mb-1">Feltétek:</p>
                    <p class="mb-3">{{ pizza.prOther }}</p>
                </div>

                <div>
                    <p class="mb-1">Ár: {{ pizza.prPrice }}</p>
                    <div v-if="jog == 9" class="btn-group">
                        <router-link class="btn btn-sm btn-outline-primary" to="/pizza-modositasa"
                            @click="modifyClick(pizza.prId)"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                <path
                                    d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                            </svg> Módosítás</router-link>
                        <button type="button" class="btn btn-sm btn-outline-danger" @click="deleteClick(pizza)"><svg
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
</template>

<script>
import axios from "axios";
export default {
    name: 'Pizza',
    props: {
        pizza: Object,
        jog: Number
    },
    methods: {
        modifyClick(id) {
            this.$store.state.productId = id;
        },
        pizzakBeolvasasa() {
            let url = "https://localhost:5001/Product";
            axios
                .get(url)
                .then((response) => {
                    this.$store.state.products = response.data;
                    //console.log(this.products);
                    for (let i = 0; i < 4; i++) {
                        this.favProducts.push(this.$store.state.products[i + i * 2]);
                    }
                    for (let i = 0; i < this.$store.state.products.length; i++) {
                        this.$store.state.products[i].prSize = JSON.parse(this.$store.state.products[i].prSize);
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
                            //alert(response.data);
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
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
