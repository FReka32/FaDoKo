<template>
    <div class="aboutus position-relative ff_comfortaa  bg_light_green text_dark_green lg_shadow"  id="rolunk">
        <div class="container-fluid p-0 p-md-5">
            <h2 class="text-center text-2 mb-3 pt-5">{{ title }}</h2>
            <div class="row mx-0">
                <div class="col-12 col-lg-6 order-2 order-lg-1">
                    <div class="aboutus_txt_container p-3 p-xl-5 fw_500">
                        <p>Éttermünkben kizárólag minőségi, friss, nagyrészt saját termelésű alapanyagokból készült pizzákat talál, így a kifogástalan olasz vacsoraélmény garantált. Olaszországból érkezett séfünk lelkesen dolgozik azon, hogy mindig új és izgalmas ízekkel rukkoljon elő, melyek kielégítik a legváltozatosabb ízléseket is, megtartva a hagyományos nápolyi pizzakészítés alapjait. A pizzáink elkészítése során kiemelt figyelmet fordítunk a részletekre, így a végeredmény mindig tökéletes lesz. </p>
                        <p>Szakácsaink nagy odafigyeléssel állítanak össze minden egyes pizzát közvetlenül a rendelést követően, majd a sütés egyedi kemencéinkben történik, amely garantálja a tökéletes, ropogós tésztát és az ínycsiklandóan megpirult feltéteket. </p>
                        <p>Ha szeretné kipróbálni különlegességeinket, akkor ne habozzon, látogasson el hozzánk vagy vegye igénybe házhozszállítás szolgáltatásunkat telefonon, és garantáltan elégedett lesz az eredménnyel! </p>
                    </div>
                </div>
                <div class="col-12 col-lg-6 order-1 order-lg-2">
                    <div class="aboutus_img_container p-3 p-xl-5 h-100">
                        <div class="bg_img bg_pizzeria"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'AboutUs',
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
    min-height: 200px;
}
.bg_pizzeria{
    background-image: url(../assets/pizzeria.jpg);
    background-position-x: center;
    background-position-y: center;
    background-repeat: no-repeat;
    background-color: #40a502;
}

</style>
