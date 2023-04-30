<template>
    <div class="card shadow-sm">
        <img class="img-fluid" :src="'data:image/jpeg;base64,' + pizzaFav.prUrl">
        <div class="card-body">
            <div class="card-text">
                <p class="ff_comfortaa mb-3 h5">{{ pizzaFav.prName }}</p>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'PizzaFav',
    props: {
        pizzaFav: Object
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
