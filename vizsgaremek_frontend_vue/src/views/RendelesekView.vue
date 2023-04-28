<template>
  <div class="rendelesek mt-5">
    <div class=" ff_comfortaa  bg_light_green text_dark_green lg_shadow py-5">
      <div class="p-5 pb-4 border-bottom-0">
        <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
        <h1 class="fw-bold mb-4 fs-2 text-center" id="pageTop">Rendelések</h1>
      </div>
      <div class="row mx-0">
        <div class="col-10 offset-1">
          <div class="p-2 p-lg-5 pt-0 horizontal-scroll" >
            <table class="table table-striped helpyou_table text_dark_green ff_comfortaa ">
              <thead class="thead-dark">
                <tr>
                  <th>Rendelés azonosító</th>
                  <th>Rendelés tartalma</th>
                  <th>Felhasználó azonosító</th>
                  <th>Név</th>
                  <th>Cím</th>
                  <th>Telefon</th>
                  <th>Email</th>
                  <th>Állapot</th>
                  <th>Rendelési idő</th>
                  <th>Műveletek</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="rendeles in rendelesek.slice().reverse()" v-bind:key="rendeles.orId" :id="rendeles.orId">
                  <td>{{ rendeles.orId }}</td>
                  <td>{{ rendeles.orData }}</td>
                  <td class="text-center">{{ rendeles.adId }}</td>
                  <td>{{ rendeles.name }}</td>
                  <td>{{ rendeles.address }}</td>
                  <td>{{ rendeles.phone }}</td>
                  <td>{{ rendeles.email }}</td>
                  <td class="text-center">{{ rendeles.status }}</td>
                  <td>{{ rendeles.logDate }}</td>
                  <td class="text-center">
                    <button class="btn btn-sm btn-outline-primary me-1"
                      @click="rendelesBeolvasasa(rendeles.orId)"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                        height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
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
        <div class=" mt-5 col-12 col-md-6 offset-md-3 col-xl-4 offset-xl-4">
          <h2 class="fw-bold mb-4 fs-4 text-center">Módosítás</h2>
          <div class="p-5 pt-0">
            <form class=""  id="modositasForm">
              <div class="mb-5">
                <div class="form-floating">
                  <input type="text" class="form-control rounded-3 mb-3" id="floatingOrId" placeholder="OrId"
                    v-model="this.orId" disabled />
                  <label for="floatingOrId">Rendelés azonosítója</label>
                </div>
                <div class="form-floating">
                  <input type="text" class="form-control rounded-3 mb-3" id="floatingOrData" placeholder="OrData"
                    v-model="this.orData" />
                  <label for="floatingOrData">Rendelés tartalma</label>
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
                <div class="form-floating">
                  <input type="text" class="form-control rounded-3 mb-3" id="floatingStatus" placeholder="Status"
                    v-model="this.status" />
                  <label for="floatingStatus">Állapot</label>
                </div>
              </div>
              <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button"
                @click="rendelesMentes(orId, orData, name, address, phone, email, status)">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-save"
                  viewBox="0 0 16 16">
                  <path
                    d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z" />
                </svg>
                Mentés
              </button>
              <button class="w-100 mb-2 btn btn-lg rounded-3 btn-outline-primary" type="button"
                @click="rendelesMegse()">
                Mégse
              </button>
            </form>
          </div>
        </div>

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
      logged: this.$store.state.logged,
      rendelesek: [],
      rendeles: "",
      orId: "",
      orData: "",
      name: "",
      address: "",
      phone: "",
      email: "",
      status: ""
    };
  },

  methods: {
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
    rendelesMentes(orId, orData, name, address, phone, email, status) {
      if (orId === "") {
        //POST
        axios.post("https://localhost:5001/Order", {
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
              element.scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest"  });
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
        axios
          .put("https://localhost:5001/Order/" + orId, {
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


    },
    rendelesTorlese(rendeles) {
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

    },
    rendelesMegse(){
          this.rendeles = "";
          this.orId = "";
          this.orData = "";
          this.name = "";
          this.address = "";
          this.phone = "";
          this.email = "";
          this.status = "";
    }
  },
  mounted: function () {
    this.rendelesekBeolvasasa();
  },
};
</script>
<style>
@media(max-width: 1592px){
  .horizontal-scroll{
    overflow-x : scroll;
  }
}

</style>