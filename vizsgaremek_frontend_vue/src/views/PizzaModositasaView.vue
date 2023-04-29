<template>
    <div class="pizza_modositasa mt-5">
        <div class=" ff_comfortaa  bg_light_green text_dark_green lg_shadow py-5 w-100">

            <div class="row mx-0">
                <div class="d-flex justify-content-center">
                    <div class="col-12 col-md-6 col-lg-4">

                        <div class="p-5 pb-4 border-bottom-0">
                            <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
                            <h1 class="fw-bold mb-4 fs-2 text-center">Pizza módosítása</h1>
                        </div>

                        <div class="p-5 pt-0">
                            <form class="" @submit="checkForm">
                                <div class="mb-5">
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingName"
                                            placeholder="Name" v-model="this.Name" />
                                        <label for="floatingName">Név</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingOther"
                                            placeholder="Other" v-model="this.Other" />
                                        <label for="floatingOther">Feltétek</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingUrl"
                                            placeholder="Url" v-model="this.Url" />
                                        <label for="floatingUrl">Kép</label>
                                    </div>
                                   
                                    <div class="">
                                        <select class="form-select form-control rounded-3 py-3 ps-3 form-select-sm mb-3"
                                            v-model="this.Active" id="floatingActive">
                                            <option selected value="">Aktív</option>
                                            <option value="1">1 - Aktív</option>
                                            <option value="0">0 - Inaktív</option>
                                        </select>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingPrice"
                                            placeholder="Price" v-model="this.Price" />
                                        <label for="floatingPrice">Ár</label>
                                    </div>
                                    <hr class="my-4" />
                                </div>

                                <p v-if="errors.length" class="border border-danger p-3">
                                    <b>Kérem javítsa ki a következő hibá(ka)t:</b>
                                <ul>
                                    <li v-for="error in errors">{{ error }}</li>
                                </ul>
                                </p>

                                <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-save" viewBox="0 0 16 16">
                                        <path
                                            d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z" />
                                    </svg>
                                    Mentés
                                </button>

                            </form>
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
    name: "PizzaModositasaView",
    components: {},

    data() {
        return {
            errors: [],
            pizzaId: this.$store.state.productId,
            pizza: "",
            Name: "",
            Other: "",
            Url: "",
            Active: "",
            Price: ""
        };
    },

    methods: {
        pizzaBeolvasasa() {
            let url = "https://localhost:5001/Product/" + this.pizzaId;
            axios
                .get(url)
                .then((response) => {
                    this.pizza = response.data;
                    this.Name = this.pizza.prName,
                        this.Other = this.pizza.prOther,
                        this.Url = this.pizza.prUrl,
                        this.Active = this.pizza.prActive,
                        this.Price = this.pizza.prPrice
                })
                .catch((error) => {
                    //alert(error);
                });
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
        pizzaModositas(Name, Other, Url, Active, Price) {
            axios
                .put("https://localhost:5001/Product/" + this.pizzaId, {
                    "prName": Name,
                    "prSize": JSON.stringify({ "0": "25", "1": "35", "2": "45" }),
                    "prOther": Other,
                    "coIds": "{}",
                    "prUrl": Url,
                    "prActive": Active,
                    "prPrice": Price
                })
                .then((response) => {
                    if (response.status == 200) {
                        if (confirm("Mentés sikeres. Végzett a módosítással és visszatér az Étlap oldalra?")) {
                            this.pizzakBeolvasasa();
                            document.getElementById('etlapLink').click();
                        } else {
                            //stay on page
                        }

                    } else {
                        alert("Mentés nem sikerült");
                    }
                })
                .catch((error) => {
                    //console.log(error);
                    alert("Hiba történt:\n" + error.message + "\nKérem ellenőrizze, egyedi nevet vett-e fel!");
                });
        },
        checkForm: function (e) {
            let isName = /^[a-zA-ZáéíóöőúüűÁÉÍÓÖŐÚÜŰ\s]*$/.test(this.Name);
            let isOther = /^[a-zA-ZáéíóöőúüűÁÉÍÓÖŐÚÜŰ\s,]*$/.test(this.Other);
            let isUrl = /^[a-zA-Z0-9+/]*={0,2}$/.test(this.Url);
            let isDivFour = this.Url.length % 4 === 0;
            let isNum = /^\d+$/.test(this.Price);
            if (this.Name && isName && this.Other && isOther && this.Url && isUrl && isDivFour && this.Active !== "" && this.Price && isNum) {
                this.pizzaModositas(this.Name, this.Other, this.Url, this.Active, this.Price);
            }

            this.errors = [];

            if (!this.Name) {
                this.errors.push('A név megadása kötelező.');
            }
            if (!isName) {
                this.errors.push('A név csak a magyar ABC kis- és nagybetűit és szóközt tartalmazhat.');
            }
            if (!this.Other) {
                this.errors.push('A feltétek megadása kötelező.');
            }
            if (!isOther) {
                this.errors.push('A feltétek csak a magyar ABC kis- és nagybetűit, szóközt és veszzőt tartalmazhatnak.');
            }
            if (!this.Url) {
                this.errors.push('A képhivatkozás megadása kötelező.');
            }
            if (!isUrl) {
                this.errors.push('A képhivatkozás csak a base64-es kód lehet, annak is a "," utáni, új sorba tört részét:\n "data:image/jpeg;base64,\n/9j/4AAQSkZJRgA..."');
            }
            if (!isDivFour) {
                this.errors.push('A képhivatkozás csak 4-el osztható karakterszámú kód lehet');
            }
            if (this.Active === "") {
                this.errors.push('Az aktivitás megadása kötelező.');
            }
            if (!this.Price) {
                this.errors.push('Az ár megadása kötelező.');
            }
            if (!isNum) {
                this.errors.push('Az ár csak számokat tartalmazhat');
            }

            e.preventDefault();
        }
    },
    mounted: function () {
        this.pizzaBeolvasasa();
        //console.log(this.$store.state.productId);
        //console.log(this.$store.state.logged);
        //console.log(this.$store.state.jogosultsag);
    },
};
</script>
  