<template>
  <div class="login mt-5">
    <div class=" ff_comfortaa bg_light_green text_dark_green lg_shadow py-5">

      <div class="row">
        <div class="d-flex justify-content-center">
          <div class="col-12 col-md-6 col-lg-4">

            <div class="p-5 pb-4 border-bottom-0">
              <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
              <h1 v-if="!logged" class="fw-bold mb-0 fs-2 text-center">Bejelentkezés</h1>
              <h1 v-else class="fw-bold mb-0 fs-2 text-center">Kijelentkezés</h1>
            </div>

            <div class="p-5 pt-0">
              <form class="">
                <div v-if="!logged">
                  <div class="form-floating mb-3">
                    <input type="text" class="form-control rounded-3" id="floatingInput" placeholder="UserName"
                      v-model="FelhasznaloNeve" />





                    <label for="floatingInput">Felhasználónév</label>
                  </div>
                  <div class="form-floating mb-3">
                    <input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password"
                      v-model="Password" />





                    <label for="floatingPassword">Jelszó</label>
                  </div>
                </div>
                <button v-if="!logged" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button"
                  @click="loginClick(FelhasznaloNeve, Password)">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                      d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
                    <path fill-rule="evenodd"
                      d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />














                  </svg>
                  Bejelentkezés
                </button>
                <button v-else class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button" @click="logoutClick()">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                      d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
                    <path fill-rule="evenodd"
                      d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />















                  </svg>
                  Kijelentkezés
                </button>
                <hr class="my-4" />

                <div v-if="!logged">
                  <div class="w-100 py-2 mb-2">
                    <router-link class="nav-link text-underline text-center" to="/regisztracio"><svg
                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-person-add" viewBox="0 0 16 16">
                        <path
                          d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Z" />
                        <path
                          d="M8.256 14a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Z" />
                      </svg> Regisztráció</router-link>
                  </div>

                  <div class="w-100 py-2 mb-2">
                    <router-link class="nav-link text-underline text-center" to="/elfelejtett-jelszo"><svg
                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-unlock"
                        viewBox="0 0 16 16">
                        <path
                          d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2zM3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1H3z" />
                      </svg> Elfelejtett jelszó</router-link>
                  </div>

                </div>
                <div v-else>
                  <div class="w-100 py-2 mb-2">
                    <router-link class="nav-link text-underline text-center" to="/jelszo-modositasa"><svg
                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-unlock"
                        viewBox="0 0 16 16">
                        <path
                          d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2zM3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1H3z" />
                      </svg>Jelszó megváltoztatása</router-link>
                  </div>
                </div>
                <!--button class="w-100 py-2 mb-2 btn btn-outline-warning rounded-3" type="submit">
                <svg class="bi me-1" width="16" height="16"><use xlink:href="#github"/></svg>
                Jelszó csere
              </button-->
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
import sha256 from "sha256";

export default {
  name: "LoginView",
  components: {},

  data() {
    return {
      FelhasznaloNeve: "",
      Password: "",
      logged: this.$store.state.logged,
      jog: this.$store.state.jogosultsag
    };
  },

  methods: {
    closeClick() {
      this.$router.push("/");
    },
    logoutClick() {
      let url = "https://localhost:5001/Logout/" + this.$store.state.Uid;
      //console.log(url);
      axios
        .post(url)
        .then((response) => {
          if (response.status == 200) {
            this.$store.state.logged = false;
            this.$store.state.Uid = "";
            this.$store.state.teljesNev = "";
            this.$store.state.jogosultsag = 0;
            //alert(response.data);
            document.getElementById("loginButton").innerHTML = "Bejelentkezés";
            document.location.href = "/";
          } else {
            //alert(response.data);

          }
        })
        .catch((error) => {
          //console.log(error);
        });
    },
    loginClick(FelhasznaloNeve, Password) {
      axios
        .post("https://localhost:5001/Login/SaltRequest/" + FelhasznaloNeve)
        .then((response) => {
          let lekertSalt = response.data;
          //console.log(lekertSalt);
          let tmpHash = sha256(Password + lekertSalt).toString();
          let url =
            "https://localhost:5001/Login?nev=" +
            FelhasznaloNeve +
            "&tmpHash=" +
            tmpHash;
          axios
            .post(url)
            .then((response) => {
              this.$store.state.Uid = response.data[0];
              this.$store.state.userName = response.data[1];
              this.$store.state.jogosultsag = response.data[2];
              //console.log(this.$store.state.Uid);
              //console.log(this.$store.state.userName);
              //console.log(this.$store.state.jogosultsag);
              if (response.status == 200) {
                this.$store.state.logged = true;
                this.refreshData();
                this.closeClick();
                //alert("Sikeres bejelentkezés: " + this.$store.state.userName);
              } else {
                //alert(this.$store.state.Uid);
              }
            })
            .catch((error) => {
              //alert("Hiba történt:\n" + error.message);
            });
        })
        .catch((error) => {
          //console.log(error);
          //alert("Hiba történt:\n" + error.message);
        });
    },
    refreshData() {
      if (this.$store.state.logged) {
        document.getElementById("loginButton").innerHTML = "Kijelentkezés";
        document.getElementById("usersNavLink").classList.remove("d-none");
      } else {
        document.getElementById("loginButton").innerHTML = "Bejelentkezés";
        document.getElementById("usersNavLink").classList.add("d-none");
      }
    },
  },
};
</script>


