<template>
  <div class="login mt-5">
    <div class=" ff_comfortaa  bg_light_green text_dark_green lg_shadow py-5">
      <h1 v-if="!logged" class="fw-bold fs-2 text-center my-4">Bejelentkezés</h1>
      <h1 v-else class="fw-bold fs-2 text-center my-5">Admin műveletek</h1>
      <div class="row mx-0">

        <div class="col-12 col-md-10 offset-md-1 col-lg-8 offset-lg-2">
          <div v-if="logged">
            <h2 class="fs-5">Regisztrált felhasználók:</h2>
            <div class="pb-lg-5 my-3 horizontal-scroll">
              <table class="table table-striped helpyou_table text_dark_green ff_comfortaa " id="regTable">
                <thead class="thead-dark">
                  <tr>
                    <th>ID</th>
                    <th>Név</th>
                    <th class="text-center">Jogosultság</th>
                    <th>E-mail</th>
                    <th>Telefon</th>
                    <th class="text-center">Aktív</th>
                    <th>Műveletek</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="felhasznalo in felhasznalok" v-bind:key="felhasznalo.id" :id="felhasznalo.adId">
                    <td>{{ felhasznalo.adId }}</td>
                    <td>{{ felhasznalo.adName }}</td>
                    <td class="text-center">{{ felhasznalo.adPermission }}</td>
                    <td>{{ felhasznalo.adEmail }}</td>
                    <td>{{ felhasznalo.adPhone }}</td>
                    <td class="text-center">{{ felhasznalo.active }}</td>
                    <td class="text-center">
                      <button class="btn btn-sm btn-outline-primary me-1"
                        @click="felhasznaloBeolvasasa(felhasznalo.adId)"><svg xmlns="http://www.w3.org/2000/svg"
                          width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                          <path
                            d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                        </svg></button>
                      <button type="button" class="btn btn-sm btn-outline-danger"
                        @click="felhasznaloTorlese(felhasznalo)"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                          height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                          <path
                            d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
                          <path
                            d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
                        </svg></button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class=" mt-5 col-12 col-md-6 offset-md-3">
              <h2 class="fw-bold mb-4 fs-4 text-center">Módosítás</h2>
              <div class="pb-5">
                <form class="" id="modositasForm">
                  <div class="mb-5">
                    <div class="form-floating">
                      <input type="text" class="form-control rounded-3 mb-3" id="floatingAdId" placeholder="AdId"
                        v-model="this.adId" disabled />
                      <label for="floatingAdId">ID</label>
                    </div>
                    <div class="form-floating">
                      <input type="text" class="form-control rounded-3 mb-3" id="floatingAdName" placeholder="AdName"
                        v-model="this.adName" />
                      <label for="floatingAdName">Név</label>
                    </div>
                    <div class="form-floating">
                      <input type="text" class="form-control rounded-3 mb-3" id="floatingAdPermission"
                        placeholder="AdPermission" v-model="this.adPermission" />
                      <label for="floatingAdPermission">Jogosultság</label>
                    </div>
                    <div class="form-floating">
                      <input type="text" class="form-control rounded-3 mb-3" id="floatingAdEmail" placeholder="AdEmail"
                        v-model="this.adEmail" />
                      <label for="floatingAdEmail">E-mail</label>
                    </div>
                    <div class="form-floating">
                      <input type="text" class="form-control rounded-3 mb-3" id="floatingAdPhone" placeholder="AdPhone"
                        v-model="this.adPhone" />
                      <label for="floatingAdPhone">Telefon</label>
                    </div>
                    <div class="form-floating">
                      <input type="text" class="form-control rounded-3 mb-3" id="floatingActive" placeholder="active"
                        v-model="this.active" />
                      <label for="floatingActive">Aktív</label>
                    </div>
                    <div class="form-floating">
                      <input type="text" class="form-control rounded-3 mb-3" id="floatingPwd" placeholder="pwd"
                        v-model="pwd" />
                      <label for="floatingPwd">Jelszó</label>
                    </div>
                  </div>
                  <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button"
                    @click="felhasznaloMentes(adId, adName, adPermission, adEmail, adPhone, active, pwd)">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-save"
                      viewBox="0 0 16 16">
                      <path
                        d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z" />
                    </svg>
                    Mentés
                  </button>
                  <button class="w-100 mb-2 btn btn-lg rounded-3 btn-outline-primary" type="button"
                    @click="felhasznaloMegse()">
                    Mégse
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-md-6 offset-md-3 col-lg-4 offset-lg-4">
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
              <div class="d-flex justify-content-center">
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
                <button v-else class="mb-2 btn btn-lg rounded-3 btn-secondary" type="button" @click="logoutClick()">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                      d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
                    <path fill-rule="evenodd"
                      d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                  </svg>
                  Kijelentkezés
                </button>
              </div>
            </form>
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
  name: "AdminView",
  components: {},

  data() {
    return {
      FelhasznaloNeve: "",
      Password: "",
      logged: this.$store.state.logged,
      jog: this.$store.state.jogosultsag,
      felhasznalok: [],
      felhasznalo: "",
      adId: "",
      adName: "",
      adPermission: "",
      adEmail: "",
      adPhone: "",
      active: 0,
      pwd: "",
      characters: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    };
  },

  methods: {
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
            //document.getElementById("adminButton").innerHTML = "Admin";
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
          console.log(lekertSalt);
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
              this.$store.state.jogosultsag = Number.parseInt(response.data[2]);
              if (response.status == 200) {
                this.$store.state.logged = true;
                alert("Sikeres bejelentkezés: " + this.$store.state.userName);
                this.refreshData();
              } else {
                alert(this.$store.state.Uid);
              }
            })
            .catch((error) => {
              alert("Hiba történt:\n" + error.message);
            });
        })
        .catch((error) => {
          //console.log(error);
          alert("Hiba történt:\n" + error.message);
        });
    },
    refreshData() {
      if (this.$store.state.logged) {
        //document.getElementById("adminButton").innerHTML = "Admin";
        if (this.$store.state.jogosultsag === 9) {
          document.getElementById("adminOrders").classList.remove("d-none");
        }
        document.getElementById('homePage').click();
      } else {
        //document.getElementById("adminButton").innerHTML = "Admin";
        document.getElementById("adminOrders").classList.remove("d-none");
      }
    },
    felhasznalokBeolvasasa() {
      let url = "https://localhost:5001/Admin";
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
    felhasznaloBeolvasasa(adId) {
      let url = "https://localhost:5001/Admin/" + adId;
      axios
        .get(url)
        .then((response) => {
          this.felhasznalo = response.data;
          this.adId = this.felhasznalo.adId;
          this.adName = this.felhasznalo.adName;
          this.adPermission = this.felhasznalo.adPermission;
          this.adEmail = this.felhasznalo.adEmail;
          this.adPhone = this.felhasznalo.adPhone;
          this.active = this.felhasznalo.active;
          const element = document.getElementById("modositasForm");
          element.scrollIntoView({ behavior: "smooth", block: "end", inline: "nearest" });
        })
        .catch((error) => {
          //alert(error);
        });
    },
    felhasznaloMentes(adId, adName, adPermission, adEmail, adPhone, active, pwd) {
      if (adId === "") {
        //POST
       let pwdData = this.generateHash(pwd);
        axios.post("https://localhost:5001/Admin", {
          "adName": adName,
          "adPermission": adPermission,
          "adEmail": adEmail,
          "adPhone": adPhone,
          "active": active,
          "salt": pwdData.salt,
          "hash": pwdData.hash
        })
          .then((response) => {
            if (response.status == 200) {
              alert("Fehasználó mentése sikeres");
              this.felhasznalokBeolvasasa();
              const element = document.getElementById("regTable");
              element.scrollIntoView({ behavior: "smooth", block: "end", inline: "nearest" });
            } else {
              alert("Felhasználó mentése nem sikerült");
            }
          })
          .catch((error) => {
            //console.log(error);
            alert("Hiba történt:\n" + error.message);
          });
      } else {
        //PUT
          let pwdData = this.generateHash(pwd);
          axios
          .put("https://localhost:5001/Admin/" + adId, {
            "adName": adName,
            "adPermission": adPermission,
            "adEmail": adEmail,
            "adPhone": adPhone,
            "active": active,
            "salt": pwdData.salt,
            "hash": pwdData.hash
          })
          .then((response) => {
            if (response.status == 200) {
              alert("Módosítás mentése sikeres");
              this.felhasznalokBeolvasasa();
              const element = document.getElementById(adId);
              element.scrollIntoView({ behavior: "smooth", block: "center", inline: "nearest" });

            } else {
              alert("Módosítás mentése nem sikerült");
            }
          })
          .catch((error) => {
            //console.log(error);
            alert("Hiba történt:\n" + error.message);
          });
      }


    },
    felhasznaloTorlese(felhasznalo) {
      if (confirm('Biztosan törölni akarja ezt a felhasználót?\nID: ' + felhasznalo.adId + '\nNév: ' + felhasznalo.adName)) {
        let url = "https://localhost:5001/Admin/" + felhasznalo.adId;
        axios
          .delete(url)
          .then((response) => {
            if (response.status == 200) {
              alert(response.data);
              this.felhasznalokBeolvasasa();
            } else {
              //alert(response.data);
            }
          })
          .catch((error) => {
            //console.log(error);
          });
      } else {
        // Do nothing!
      }

    },
    felhasznaloMegse() {
      this.adName = "",
        this.adPermission = "",
        this.adEmail = "",
        this.adPhone = "",
        this.active = 0,
        this.pwd = ""
    },
    generateHash(uPassword) {
      let salt = '';
      const regex = /^[a-zA-Z0-9]+$/;
      for (let i = 0; i < 64; i++) {
        salt += this.characters.charAt(Math.floor(Math.random() * this.characters.length));
      }
      if (!regex.test(salt)) {
        alert('Érvénytelen karaktereket adott meg a jelszóban!');
      }
      const hash = sha256(sha256(uPassword + salt)).toString();
      return { "salt": salt, "hash": hash };
    }
  },
  mounted: function () {
    this.felhasznalokBeolvasasa();
  },
};
</script>


