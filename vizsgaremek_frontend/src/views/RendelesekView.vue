<template>
  <div class="rendelesek mt-5">
    <div class=" ff_comfortaa  bg_light_green text_dark_green lg_shadow py-5">
      <div class="p-5 pb-4 border-bottom-0">
        <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
        <h1 class="fw-bold mb-4 fs-2 text-center" id="pageTop">Rendelések</h1>
      </div>
      <div v-if="logged" class="row mx-0">
        <div class="col-12 offset-0 col-md-10 offset-md-1">
          <div class="p-2 px-lg-5 pb-lg-5 pt-0 horizontal-scroll">
            <table class="table table-striped helpyou_table text_dark_green ff_comfortaa ">
              <thead class="thead-dark">
                <tr>
                  <th>Rendelés azonosító</th>
                  <th>Állapot</th>
                  <th>Dolgozó azonosító</th>
                  <th>Rendelés tartalma</th>
                  <th>Név</th>
                  <th>Cím</th>
                  <th>Telefon</th>
                  <th>Email</th>
                  <th>Rendelési idő</th>
                  <th>Műveletek</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="rendeles in rendelesek.slice().reverse()" v-bind:key="rendeles.orId" :id="rendeles.orId">
                  <td>{{ rendeles.orId }}</td>
                  <td class="text-center">{{ rendeles.status }}</td>
                  <td class="text-center">{{ rendeles.adId }}</td>
                  <td>{{ rendeles.orData }}</td>
                  <td>{{ rendeles.name }}</td>
                  <td>{{ rendeles.address }}</td>
                  <td>{{ rendeles.phone }}</td>
                  <td>{{ rendeles.email }}</td>
                  <td>{{ rendeles.logDate }}</td>
                  <td class="text-center">
                    <button class="btn btn-sm btn-outline-primary me-1" @click="rendelesBeolvasasa(rendeles.orId)"><svg
                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil"
                        viewBox="0 0 16 16">
                        <path
                          d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                      </svg></button>
                    <button type="button" class="btn btn-sm btn-outline-danger" @click="rendelesTorlese(rendeles)"><svg
                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash"
                        viewBox="0 0 16 16">
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
        </div>
        <div class=" mt-5 col-12 col-md-8 offset-md-2 col-xl-4 offset-xl-4">
          <h2 class="fw-bold mb-4 fs-4 text-center">Módosítás</h2>
          <div class="p-5 pt-0">
            <form class="" id="modositasForm" @submit="checkForm">
              <div class="mb-5">
                <div class="form-floating">
                  <input type="text" class="form-control rounded-3 mb-3" id="floatingOrId" placeholder="OrId"
                    v-model="this.orId" disabled />
                  <label for="floatingOrId">Rendelés azonosítója</label>
                </div>
                <div class="">
                  <select class="form-select form-control rounded-3 py-3 ps-3 form-select-sm mb-3" v-model="this.status"
                    id="floatingStatus">
                    <option selected value="">Kérem válasszon státuszt!</option>
                    <option value="0">0 - Rendelés felvéve</option>
                    <option value="1">1 - Elkészítés alatt</option>
                    <option value="2">2 - Elkészítve</option>
                    <option value="3">3 - Szállítás alatt</option>
                    <option value="4">4 - Kiszállítva</option>
                  </select>
                </div>

                <div class="">
                  <select class="form-select form-control rounded-3 py-3 ps-3 form-select-sm mb-3" id="floatingAdId" v-model="this.adId">
                    <option selected value="" id="defaultMeretOption">Kérem válasszon dolgozót!</option>
                    <template v-for="dolgozo in dolgozok" :key="dolgozok.adId">
                      <option v-if="this.status == '0' && dolgozo.adPermission == '7'" :value="dolgozo.adId">
                        {{ dolgozo.adId }} - {{ dolgozo.adPermission }} - {{ dolgozo.adName }}</option>
                      <option v-if="this.status == '1' && dolgozo.adPermission == '6'" :value="dolgozo.adId">
                        {{ dolgozo.adId }} - {{ dolgozo.adPermission }} - {{ dolgozo.adName }}</option>
                      <option v-if="this.status == '2' && dolgozo.adPermission == '5'" :value="dolgozo.adId">
                        {{ dolgozo.adId }} - {{ dolgozo.adPermission }} - {{ dolgozo.adName }}</option>
                      <option v-if="(this.status == '3' || this.status == '4') && dolgozo.adPermission == '4'" :value="dolgozo.adId">
                        {{ dolgozo.adId }} - {{ dolgozo.adPermission }} - {{ dolgozo.adName }}</option>
                    </template>

                  </select>
                </div>

                <div class="form-floating">
                  <input type="text" class="form-control rounded-3 mb-3" id="floatingOrData" placeholder="OrData"
                    v-model="this.orData" />
                  <label for="floatingOrData">Rendelés tartalma</label>
                </div>

                <div class="row mx-0">
                  <div class="col px-0">
                    <div class="">
                      <select class="form-select form-control rounded-3 py-3 ps-3 form-select-sm mb-3"
                        v-model="this.pizzaValasztas" id="floatingPizzak">
                        <option selected value="" id="defaultPizzaOption">Kérem válasszon pizzát!</option>
                        <option v-for="pizza in pizzak" :value=pizza.prId>{{ pizza.prId }} - {{ pizza.prName }}</option>
                      </select>
                    </div>
                    <div class="">
                      <select class="form-select form-control rounded-3 py-3 ps-3 form-select-sm mb-3"
                        v-model="this.meretValasztas" id="floatingMeretek">
                        <option selected value="" id="defaultMeretOption">Kérem válasszon méretet!</option>
                        <option v-for="meret in meretek" :value=meret> {{ meret }}</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-auto pe-0">
                    <div class="d-flex flex-column">

                      <button class="w-100 mt-2 mb-1 btn btn-lg rounded-3 btn-primary" type="button"
                        @click="pizzaHozzaadasaRendeleshez(this.pizzaValasztas, this.meretValasztas)">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                          class="bi bi-plus-circle" viewBox="0 0 16 16">
                          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                          <path
                            d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                        </svg>
                      </button>
                      <button class="w-100 mt-1 mb-3 btn btn-lg rounded-3 btn-danger" type="button" @click="pizzaMegse()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                          class="bi bi-x-lg" viewBox="0 0 16 16">
                          <path
                            d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z" />
                        </svg>
                      </button>
                    </div>
                  </div>
                </div>



                <div class="form-floating">
                  <input type="text" class="form-control rounded-3 mb-3" id="floatingName" placeholder="Name"
                    v-model="this.name" />
                  <label for="floatingName">Név</label>
                </div>
                <div class="form-floating">
                  <input type="text" class="form-control rounded-3 mb-3" id="floatingAddress" placeholder="Address"
                    v-model="this.address" />
                  <label for="floatingAddress">Cím</label>
                </div>
                <div class="form-floating">
                  <input type="text" class="form-control rounded-3 mb-3" id="floatingPhone" placeholder="Phone"
                    v-model="this.phone" />
                  <label for="floatingPhone">Telefon</label>
                </div>
                <div class="form-floating">
                  <input type="text" class="form-control rounded-3 mb-3" id="floatingEmail" placeholder="Email"
                    v-model="this.email" />
                  <label for="floatingEmail">Email</label>
                </div>
              </div>
              <p v-if="errors.length" class="border border-danger p-3">
                <b>Kérem javítsa ki a következő hibá(ka)t:</b>
              <ul>
                <li v-for="error in errors">{{ error }}</li>
              </ul>
              </p>
              <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-save"
                  viewBox="0 0 16 16">
                  <path
                    d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z" />
                </svg>
                Mentés
              </button>
              <button class="w-100 mb-2 btn btn-lg rounded-3 btn-outline-primary" type="button" @click="rendelesMegse()">
                Mégse
              </button>
            </form>
          </div>
        </div>

      </div>
      <div v-else>
        <p class="text-center h5">Kérjük, jelentkezzen be!</p>
      </div>
    </div>
  </div>
</template>
  
<script>
import axios from "axios";

export default {
  name: "RendelesekView",
  components: {
  },
  data() {
    return {
      errors: [],
      logged: this.$store.state.logged,
      jog : this.$store.state.jogosultsag,
      rendelesek: [],
      pizzak: [],
      dolgozok: [],
      meretek: { 0: "25", 1: "35", 2: "45" },
      rendeles: "",
      orId: "",
      adId: "",
      orData: "[]",
      pizzaValasztas: "",
      meretValasztas: "",
      name: "",
      address: "",
      phone: "",
      email: "",
      status: ""
    };
  },

  methods: {
    dolgozokBeolvasasa() {
      let url = "https://localhost:5001/Admin";
      axios
        .get(url)
        .then((response) => {
          console.log(this.status);
          this.dolgozok = response.data;
          console.log(this.dolgozok);
        })
        .catch((error) => {
          //alert(error);
        });
    },
    pizzakBeolvasasa() {
      let url = "https://localhost:5001/Product";
      axios
        .get(url)
        .then((response) => {
          this.pizzak = response.data;

        })
        .catch((error) => {
          //alert(error);
        });
    },
    pizzaHozzaadasaRendeleshez(pizzaId, meret) {
      let item = { "prId": pizzaId, "prSize": meret };
      this.orData = JSON.parse(this.orData);
      this.orData.push(item);
      this.orData = JSON.stringify(this.orData);
    },
    rendelesekBeolvasasa() {
      let url = "https://localhost:5001/Order";
      axios
        .get(url)
        .then((response) => {
          this.rendelesek = response.data;
          //console.log(this.rendelesek);
        })
        .catch((error) => {
          //alert(error);
        });
    },
    rendelesBeolvasasa(orderId) {
      let url = "https://localhost:5001/Order/" + orderId;
      axios
        .get(url)
        .then((response) => {
          this.rendeles = response.data;
          this.orId = this.rendeles.orId;
          this.adId = this.rendeles.adId;
          this.orData = this.rendeles.orData;
          this.name = this.rendeles.name;
          this.address = this.rendeles.address;
          this.phone = this.rendeles.phone;
          this.email = this.rendeles.email;
          this.status = this.rendeles.status;
          const element = document.getElementById("modositasForm");
          element.scrollIntoView({ behavior: "smooth", block: "end", inline: "nearest" });
        })
        .catch((error) => {
          //alert(error);
        });
    },
    rendelesMentes(orId, adId, orData, name, address, phone, email, status) {
      console.log(this.jog);
      if (this.jog >= 7) {
      if (orId === "") {
        //POST
        console.log("rendelésmentés post");
        axios.post("https://localhost:5001/Order", {
          "adId": adId,
          "orData": orData,
          "name": name,
          "address": address,
          "phone": phone,
          "email": email,
          "status": status,
          "logDate": new Date().toISOString(),
        })
          .then((response) => {
            if (response.status == 200) {
              alert("Mentés sikeres");
              this.rendelesekBeolvasasa();
              const element = document.getElementById("pageTop");
              element.scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest" });
            } else {
              alert("Mentés nem sikerült");
            }
          })
          .catch((error) => {
            //console.log(error);
            alert("Hiba történt:\n" + error.message);
          });
      } else {
        //PUT
        console.log("rendelésmentés put");
        axios
          .put("https://localhost:5001/Order/" + orId, {
            "adId": adId,
            "orData": orData,
            "name": name,
            "address": address,
            "phone": phone,
            "email": email,
            "status": status,
            "logDate": new Date().toISOString(),
          })
          .then((response) => {
            if (response.status == 200) {
              alert("Mentés sikeres");
              this.rendelesekBeolvasasa();
              const element = document.getElementById(orId);
              element.scrollIntoView({ behavior: "smooth", block: "center", inline: "nearest" });

            } else {
              alert("Mentés nem sikerült");
            }
          })
          .catch((error) => {
            //console.log(error);
            alert("Hiba történt:\n" + error.message);
          });
      }
    }else{
      alert("A rendelések hozzáadásához és módosításához nincs jogosultsága!")
    }

    },
    rendelesTorlese(rendeles) {
      if (this.jog >=7 ) {
      if (confirm('Biztosan törölni akarja ezt a rendelést?\nID: ' + rendeles.orId + '\nNév: ' + rendeles.name + '\nDátum: ' + rendeles.logDate)) {
        let url = "https://localhost:5001/Order/" + rendeles.orId;
        axios
          .delete(url)
          .then((response) => {
            if (response.status == 200) {
              alert(response.data);
              this.rendelesekBeolvasasa();
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
    } else {
      alert("A rendelések törléséhez nincs jogosultsága!");
    }

    },
    rendelesMegse() {
      this.rendeles = "";
      this.orId = "";
      this.adId = "";
      this.orData = "";
      this.name = "";
      this.address = "";
      this.phone = "";
      this.email = "";
      this.status = "";
    },
    pizzaMegse() {
      document.getElementById("defaultPizzaOption").selected = true;
      document.getElementById("defaultMeretOption").selected = true;
    },
    checkForm: function (e) {
      let isName = /^[a-zA-ZáéíóöőúüűÁÉÍÓÖŐÚÜŰ\s]*$/.test(this.Name);
      let isPhone = /^(?:(?:\+|00)[01]|(?:\+|00)36|0[06])(?:1|20|30|31|40|50|70|71|72|73|75|76|[2-9]\d{1})[0-9]{6,7}$/.test(this.phone);
      let isEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email);
      console.log("ellenőrzés");
      if (this.adId !== "" && this.orData && this.name && isName && this.address && this.phone && isPhone && this.email && isEmail && this.status !== "") {
        console.log("mentés functionig eljött");
        this.rendelesMentes(this.orId, this.adId, this.orData, this.name, this.address, this.phone, this.email, this.status)
      }

      console.log(this.adId);

      this.errors = [];

      if (this.adId === "") {
        this.errors.push('A dolgozói azonosító megadása kötelező.');
      }
      if (!this.orData) {
        this.errors.push('A rendelés tartalmának megadása kötelező.');
      }
      if (!this.name) {
        this.errors.push('A név megadása kötelező.');
      }
      if (!isName) {
        this.errorsModositas.push('A név csak a magyar ABC kis- és nagybetűit, valamint számokat és szóközt tartalmazhat.');
      }
      if (!this.address) {
        this.errors.push('A cím megadása kötelező.');
      }
      if (!this.phone) {
        this.errors.push('A telefonszám megadása kötelező.');
      }
      if (!isPhone) {
        this.errors.push('Érvényes formátumú telefonszámot kell megadni!');
      }
      if (!this.email) {
        this.errors.push('Az email megadása kötelező.');
      }
      if (!isEmail) {
        this.errors.push('Érvényes formátumú email-t kell megadni!');
      }
      if (this.status === "") {
        this.errors.push('A állapot megadása kötelező.');
      }

      e.preventDefault();
    },
  },
  mounted: function () {
    this.rendelesekBeolvasasa();
    this.pizzakBeolvasasa();
    this.dolgozokBeolvasasa();
  },
};
</script>