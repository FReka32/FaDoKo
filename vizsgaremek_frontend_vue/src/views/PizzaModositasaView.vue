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
                            <form class="">
                                <div class="mb-5">
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingName"
                                            placeholder="Name" v-model="this.Name" />
                                        <label for="floatingName">Név</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingOther"
                                            placeholder="Other" v-model="this.Other" />
                                        <label for="floatingOther">Összetevők</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingUrl"
                                            placeholder="Url" v-model="this.Url" />
                                        <label for="floatingUrl">Kép</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingActive"
                                            placeholder="Active" v-model="this.Active" />
                                        <label for="floatingActive">Aktív-e</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingPrice"
                                            placeholder="Price" v-model="this.Price" />
                                        <label for="floatingPrice">Ár</label>
                                    </div>
                                    <hr class="my-4" />
                                </div>

                                <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button"
                                    @click="pizzaModositas(Name, Other, Url, Active, Price)">
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
                            document.getElementById('etlapLink').click();
                        } else{
                            //stay on page
                        }
                       
                    } else {
                        alert("Mentés nem sikerült");
                    }
                })
                .catch((error) => {
                    //console.log(error);
                    alert("Hiba történt:\n" + error.message);
                });
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
  