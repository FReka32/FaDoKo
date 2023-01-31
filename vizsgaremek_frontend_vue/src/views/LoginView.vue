<template>
  <div class="login">
    <h1>Login page</h1>
    <div class="" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header bg-warning">
            <h5 v-if="!logged" class="modal-title" id="loginModalLabel">
              Bejelentkezés
            </h5>
            <h5 v-if="logged" class="modal-title" id="loginModalLabel">
              Kijelentkezés
            </h5>
            <button type="button" class="btn-close" @click="closeClick()"></button>
          </div>
          <div class="modal-body">
            <div v-if="!logged" class="input group mb-3">
              <span class="input-group-text">Név:</span>
              <input type="text" class="form-control" v-model="FelhasznaloNeve"/>
            </div>
            <div v-if="!logged" class="input group mb-3">
              <span class="input-group-text">Jelszó:</span>
              <input type="password" class="form-control" v-model="Password"/>
            </div>
            <button type="button" @click="loginClick(FelhasznaloNeve,Password)" v-if="!logged" class="btn btn-primary m-2 float-end">
              Bejelentkezés
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import sha256 from "sha256";

export default {
  name: 'LoginView',
  components: {},

  data() {
    return {
      FelhasznaloNeve: "",
      Password: "",
      logged:this.$store.state.logged,
    }
  },

  methods: {
    closeClick() {
      this.$router.push("/")
    },
    loginClick(FelhasznaloNeve,Password) {
      console.log(FelhasznaloNeve)
      axios.post("https://localhost:5001/Login/SaltRequest/"+FelhasznaloNeve).then((response)=>{
        let lekertSalt=response.data;
        console.log(response.data);
        console.log(Password)
        let tmpHash=sha256(Password+lekertSalt).toString();
        console.log(tmpHash)
        let url="https://localhost:5001/Login?nev="+FelhasznaloNeve+"&tmpHash="+tmpHash
          axios.post(url).then((response)=>{
            this.$store.state.Uid=response.data[0];
            this.$store.state.userName=response.data[1];
            this.$store.state.jogosultsag=response.data[2];
            console.log(this.$store.state.Uid);
            console.log(this.$store.state.userName);
            console.log(this.$store.state.jogosultsag);
            this.$store.state.logged=true
            this.refreshData();
          })
      })
    },
    refreshData() {
      if (this.$store.state.logged) 
      {
        document.getElementById("loginButton").innerHTML ="Logout"
      }
      else{
        document.getElementById("loginButton").innerHTML ="Login"
      }
    },
  }
}
</script>

<style scoped>
  .login{
    background-color: burlywood;
  }
</style>
