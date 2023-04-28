<template>
    <div class="aboutus position-relative ff_comfortaa  bg_light_green text_dark_green lg_shadow" id="kapcsolat">
        <div class="container-fluid p-5">
            <h2 class="text-center text-2 mb-3 pt-5">{{ title }}</h2>
            <div class="row mx-0">
                <div class="col-12 col-lg-6">
                    <div class="aboutus_img_container p-3 p-xl-5 h-100">
                        <div class="bg_img">
                            
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="aboutus_txt_container p-3 p-xl-5 fw_500">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget laoreet ligula. Proin in tortor tortor. Aenean consequat ullamcorper ultrices. Fusce eget magna quis mauris tincidunt ultricies. at, porttitor mauris id, tincidunt quam.</p>
                        <p><strong>Cím: 3525 Miskolc, Palóczy László utca 3.</strong></p>
                        <p>Szeretettel várjuk kedves vendégeinket!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'Contact',
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
    min-height: 250px;
    background-image: url(../assets/kando_terkep.png);
    background-position-x: center;
    background-position-y: center;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
}

</style>
