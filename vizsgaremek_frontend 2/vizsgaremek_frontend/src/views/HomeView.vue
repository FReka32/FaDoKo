<template>
  <div class="home">
    <HomeGreeting msg="Üdvözöljük a Pizzeria Toscana oldalán!"/>
    <AboutUs title="Éttermünk"/>
    <HelpYou title="Miben segíthetünk?"/>
    <Contact title="Hol talál meg minket?"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HomeGreeting from '@/components/HomeGreeting.vue'
import AboutUs from '@/components/AboutUs.vue'
import HelpYou from '@/components/HelpYou.vue'
import Contact from '@/components/Contact.vue'

export default {
  name: 'HomeView',
  components: {
    HomeGreeting,
    AboutUs,
    HelpYou,
    Contact
  }
}
</script>
