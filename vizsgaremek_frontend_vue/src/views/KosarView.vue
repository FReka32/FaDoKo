<template>
    <div class="kosar mt-5">
        <div class=" ff_comfortaa bg_light_green text_dark_green lg_shadow py-5">


            <div class="row mx-0">
                <div class="d-flex justify-content-center">
                    <div class="col-6">
                        <div class="p-5 pb-4 border-bottom-0">
                            <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
                            <h1 class="fw-bold mb-4 fs-2 text-center">Kosár</h1>
                        </div>
                        <table class="table table-striped helpyou_table text_dark_green ff_comfortaa">
                            <thead class="thead-dark">
                                <tr>
                                    <th colspan="2">Termék neve</th>
                                    <th class="text-center">Mennyiség</th>
                                    <th class="text-center">Törlés a kosárból</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="product in cart" v-bind:key="product.id">
                                    <td colspan="2">{{ product.name }}</td>
                                    <td class="text-center">{{ product.pc }} db</td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-danger" @click="deleteFromCart(product.id)">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                                                <path
                                                    d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z">
                                                </path>
                                                <path
                                                    d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z">
                                                </path>
                                            </svg>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row mx-0 my-5">
                <div class="d-flex justify-content-center">
                    <div class="col-12 col-md-6 col-lg-4">
                        <button class="mb-3 btn btn-lg rounded-3 btn-primary px-4 w-100" type="button">
                            Tovább a megrendeléshez
                        </button>
                    </div>
                </div>
            </div>



        </div>
    </div>
</template>
  
<script>

export default {
    name: "KosarView",
    components: {
    },
    data() {
        return {
            cart: [
            ],
        };
    },

    methods: {
        kosarBeolvasasa() {
            this.cart = [
                {
                    id: 1,
                    name: "Sonkás pizza",
                    pc: "1"
                },
                {
                    id: 2,
                    name: "Tenger gyümölcsei pizza",
                    pc: "1"
                },
                {
                    id: 3,
                    name: "Szalámis pizza",
                    pc: "2"
                }
            ]
        },
        deleteFromCart(id) {
            alert("Törlés:" + id);
        }
    },
    mounted: function () {
        this.kosarBeolvasasa();
    },
};
</script>
  