<template>
    <div class="pizza_hozzaadasa mt-5">
        <div class=" ff_comfortaa bg_light_green text_dark_green lg_shadow py-5">

            <div class="row mx-0">
                <div class="d-flex justify-content-center">
                    <div class="col-12 col-md-6 col-lg-4">

                        <div class="p-5 pb-4 border-bottom-0">
                            <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
                            <h1 class="fw-bold mb-4 fs-2 text-center">Új pizza hozzáadása</h1>
                        </div>

                        <div class="p-5 pt-0">
                            <form class="">
                                <div class="mb-5">
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingName"
                                            placeholder="Name" v-model="Name" />
                                        <label for="floatingName">Név</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingOther"
                                            placeholder="Other" v-model="Other" />
                                        <label for="floatingOther">Összetevők</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingUrl"
                                            placeholder="Url" v-model="Url" />
                                        <label for="floatingUrl">Kép</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingActive"
                                            placeholder="Active" v-model="Active" />
                                        <label for="floatingActive">Aktív-e</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control rounded-3 mb-3" id="floatingPrice"
                                            placeholder="Price" v-model="Price" />
                                        <label for="floatingPrice">Ár</label>
                                    </div>
                                    <hr class="my-4" />
                                </div>

                                <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button"
                                    @click="pizzaHozzaadas(Name, Other, Url, Active, Price)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                            d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
                                        <path fill-rule="evenodd"
                                            d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                                    </svg>
                                    Hozzáadás
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
    name: "PizzaHozzaadasaView",
    components: {},

    data() {
        return {
        };
    },

    methods: {
        pizzaHozzaadas(Name, Other, Url, Active, Price) {
            axios
                .post("https://localhost:5001/Product", {
                    "prName": Name,
                    "prSize": JSON.stringify({"0":"25","1":"35","2":"45"}),
                    "prOther": Other,
                    "coIds": "{}",
                    "prUrl": Url,
                    "prActive": Active,
                    "prPrice": Price
                })
                .then((response) => {
                    if (response.status == 200) {
                        alert("Mentés sikeres");
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
};
</script>
  