<template>
  <div class="felhasznalok">
    <HelloWorld msg="Felhasználók adatai"/>
  </div>
</template>

<script>
import HelloWorld from '@/components/HelloWorld.vue';

export default {
  name: 'FelhasznalokView',
  components: {
    HelloWorld
  }
}
</script>

<style scoped>
  .felhasznalok{
    background-color: aqua;
    
  }
</style>
