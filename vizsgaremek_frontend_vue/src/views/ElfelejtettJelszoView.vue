<template>
  <div class="login mt-5">
    <div class=" ff_comfortaa bg_light_green text_dark_green lg_shadow py-5">

      <div class="row mx-0">
        <div class="d-flex justify-content-center">
          <div class="col-12 col-md-6 col-lg-4 mx-auto">

            <div class="p-5 pb-4 border-bottom-0">
              <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
              <h1 class="fw-bold mb-4 fs-2 text-center">Elfelejtett jelszó</h1>
            </div>

            <div class="p-5 pt-0">
              <form class="">
                <div>
                  <p class="mb-4">
                    Kérjük adja regisztrált e-mail címét, amire elküldhetjük a jelszó-visszaállító linket.
                  </p>
                  <div class="form-floating">
                    <input type="text" class="form-control rounded-3 mb-5" id="floatingEmail" placeholder="Email"
                      v-model="Email" />
                    <label for="floatingEmail">Email</label>
                  </div>
                </div>
                
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button"
                      @click="emailSendClick(Email)">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                          d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
                        <path fill-rule="evenodd"
                          d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                      </svg>
                      Küldés
                    </button>
                  
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

export default {
  name: "ElfelejtettJelszoView",
  components: {},

  data() {
    return {
      Email: ""
    };
  },

  methods: {
    emailSendClick(Email) {
      axios
        .post("https://localhost:5001/NewPassword/" + Email)
        .then((response) => {
          if (response.status == 200) {
            alert("Email sent successfully");
          } else {
            alert("Email sending failed");
          }
        })
        .catch((error) => {
          //console.log(error);
          alert("Hiba történt:\n" + error.message);
        });
    }
  },
};
</script>
