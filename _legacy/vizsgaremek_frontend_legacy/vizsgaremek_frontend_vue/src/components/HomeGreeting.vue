<template>
    <div class="greeting position-relative">
        <div class="bg_img home_greeting position-absolute"></div>
        <div class="mask position-absolute"></div>
        <div class="container-fluid p-0 p-md-5 position-absolute main_h1_container">
            <h1 class="text-center text-main ff_comfortaa ">{{ msg }}</h1>
        </div>
    </div>
</template>

<script>
export default {
    name: 'HomeGreeting',
    props: {
        msg: String
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>

.greeting {
    height: 420px;
}
.bg_img {
    background-size: cover;
    height: inherit;
    width: 100%;
}
.home_greeting {
    background-image: url(../assets/home_greeting.jpg);
    background-position-x: center;
    background-position-y: center;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-color: #40a502;
}

.text-main {
    color: #ffe59b;
}
.mask {
    position: absolute;
    top: 0;
    left: 0;
    background: linear-gradient(169deg, rgba(0, 75, 140, 0) 0%, #40a502 100%);
    height: inherit;
    width: 100%;
}
.main_h1_container {
    top: 33%;
}

</style>
