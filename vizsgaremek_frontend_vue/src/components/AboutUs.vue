<template>
    <div class="aboutus position-relative ff_comfortaa  bg_light_green text_dark_green lg_shadow"  id="rolunk">
        <div class="container-fluid p-5">
            <h2 class="text-center text-2 mb-3 pt-5">{{ title }}</h2>
            <div class="row mx-0">
                <div class="col-12 col-lg-6 order-2 order-lg-1">
                    <div class="aboutus_txt_container p-3 p-xl-5 fw_500">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget laoreet ligula. Proin in tortor tortor. Aenean consequat ullamcorper ultrices. Fusce eget magna quis mauris tincidunt ultricies. at, porttitor mauris id, tincidunt quam. Vestibulum accumsan justo ex, nec convallis ex sagittis a. Morbi a elit feugi Pellentesque feugiat hendrerit lectus, aliquam lobortis massa interdum hendrerit.</p>
                        <p>Etiam vel pharetra elit. Aenean sed magna diam. Curabitur molestie justo ut lectus ornare consequat. </p>
                        <p>Vestibulum arcu neque, tincidunt ac rhoncus in, vulputate vitae justo. Proin vel blandit risus, ut interdum lacus. Vestibulum iaculis consequat fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. </p>
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
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-color: #40a502;
}

</style>
