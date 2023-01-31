<template>
    <div class="aboutus position-relative ff_comfortaa bg_light_green text_dark_green lg_shadow">
        <div class="container-fluid p-5">
            <h2 class="text-center text-2 mb-3">{{ msg }}</h2>
            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="aboutus_img_container p-3 p-xl-5 h-100">
                        <div class="bg_img">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10656.99564441432!2d20.7799792!3d48.1054339!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xdc6303e601794631!2sMiskolci%20SZC%20Kand%C3%B3%20K%C3%A1lm%C3%A1n%20Informatikai%20Technikum!5e0!3m2!1shu!2shu!4v1675351197373!5m2!1shu!2shu" width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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
        msg: String
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
/*.bg_pizzeria{
    background-image: url(../assets/pizzeria.jpg);
    background-position-x: center;
    background-position-y: center;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-color: #40a502;
}*/

</style>
