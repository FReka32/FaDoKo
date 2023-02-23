<template>
  <div class="home">
    <HomeGreeting msg="Étlap"/>
    <Products title="Pizzáink" data="{}"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HomeGreeting from '@/components/HomeGreeting.vue'
import Products from '@/components/Products.vue'

export default {
  name: 'EtlapView',
  components: {
    HomeGreeting,
    Products
  }
}
</script>




  