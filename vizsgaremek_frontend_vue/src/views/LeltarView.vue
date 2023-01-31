<template>
    <div class="leltar">
      <HelloWorld msg="Üdvözöllek az autópiac oldalamon!"/>
    </div>
  </template>
  
  <script>
  // @ is an alias to /src
  import HelloWorld from '@/components/HelloWorld.vue'
  
  export default {
    name: 'LeltarView',
    components: {
      HelloWorld
    }
  }
  </script>
  