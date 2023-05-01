<template>
    <div class="helpyou position-relative ff_comfortaa  bg_light_green text_dark_green lg_shadow">
        <div class="container mx-auto p-md-5">
            <h2 class="text-center text-2 mb-5 pt-5" id="helpYouTitle">{{ title }}</h2>
            <div class="d-flex-justify-content-center">
                <table class="table table-striped helpyou_table text_dark_green" aria-describedby="helpYouTitle">
                    <tbody>
                        <tr>
                            <td class="col-6">Telefon:</td>
                            <td class="col-6">+36301112222</td>
                        </tr>
                        <tr>
                            <td class="col-6">E-mail:</td>
                            <td class="col-6">ugyfsz@pizzeria.hu</td>
                        </tr>
                        <tr>
                            <td class="col-6">Rendelés:</td>
                            <td class="col-6">061222333<br />+36303334444</td>
                        </tr>
                        <tr>
                            <td class="col-6">Asztalfoglalás:</td>
                            <td class="col-6">061222333<br />+36305556666</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'HelpYou',
    props: {
        title: String
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>
.bg_img {
    background-size: cover;
    height: inherit;
    width: 100%;
}

.bg_pizzeria {
    background-image: url(../assets/pizzeria.jpg);
    background-position-x: center;
    background-position-y: center;
    background-repeat: no-repeat;
    background-color: #40a502;
}
.helpyou_table{
    max-width: 768px;
    margin:auto;
}
</style>
