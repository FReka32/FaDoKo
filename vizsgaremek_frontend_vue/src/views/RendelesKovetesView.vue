<template>
    <div class="rendeleskovetes  bg_light_green text_dark_green">
      <HomeGreeting msg="Rendeléskövetés" />
      <div class="container">
        <div class="py-5 my-3">
          <table class="table table-striped helpyou_table text_dark_green ff_comfortaa">
            <thead class="thead-dark">
              <tr>
                <th>ID</th>
                <th>Felhasználó neve</th>
                <th>Teljes név</th>
                <th>E-mail</th>
                <th>Jog</th>
                <th>Aktív</th>
              </tr>
            </thead>
              <tbody>
                <tr v-for="rendeles in rendelesek" v-bind:key="rendeles.id">
                  <td>{{ felhasznalo.id }}</td>
                  <td>{{ felhasznalo.felhasznaloNeve}}</td>
                  <td>{{ felhasznalo.teljesNev }}</td>
                  <td>{{ felhasznalo.email }}</td>
                  <td>{{ felhasznalo.jogosultsag }}</td>
                  <td>{{ felhasznalo.aktiv }}</td>
                </tr>
              </tbody>
          </table>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  import HomeGreeting from "@/components/HomeGreeting.vue";
  
  export default {
    name: "RendelesKovetesView",
    components: {
      HomeGreeting
  },
    data() {
      return {
        logged: this.$store.state.logged,
        rendelesek: [],
      };
    },
  
    methods: {
      refreshData() {},
      closeClick() {
        this.$router.push("/");
      },
      rendelesekBeolvasasa() {
        let url = "https://localhost:5001/Order/" + this.$store.state.Uid;
        axios
          .get(url)
          .then((response) => {
            this.felhasznalok = response.data;
            //console.log(this.felhasznalok);
          })
          .catch((error) => {
            //alert(error);
          });
      },
    },
    mounted: function () {
      this.rendelesekBeolvasasa();
    },
  };
  </script>
  