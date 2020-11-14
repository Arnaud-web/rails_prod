<template>
      <div style="display: inline-flex">
    <div class="container_hotel">
      <div class="hotel">
        <p class="name_hotel">{{ hotel.name }}</p>
        <p class="options">{{ hotel.photo }}</p>
        <p class="options">{{ hotel.speciality }}</p>
        <img class="image_hotel" :src="hotel.photo" :alt="'image100x100 '+hotel.photo" />
        <span class="options">{{ hotel.prix }} $</span>
        <div class="options">
          <button class="btn btn-sm btn-info">show</button>
          <!-- <a class="btn btn" @click="addToCart(hotel)">
          reserve
          </a> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
    props:['hotel']
}
</script>
<style>
.hotel {
  /* border: 1px solid gray; */
  padding: 12px;
  background-color: rgb(230, 230, 230);

  padding: auto;
  margin: auto;
  display: inline-grid;
}
.image_hotel {
    background-color:grey;
    min-height: 100px;
    min-width: 100px;
  max-width: 200px;
  vertical-align: middle;
  font-family: Verdana, sans-serif;
  font-size: 15px;
  line-height: 1.5;
  color: #000 !important;
  box-sizing: inherit;
  border-style: none;
  vertical-align: middle;
  width: 204px;
  height: auto;
}
.name_hotel {
  display: inline;
  background-color: rgb(110, 110, 110);

  text-align: center;
  font-family: Verdana, sans-serif;
  font-size: 15px;
  line-height: 1.5;
  color: rgb(252, 252, 252) !important;
  box-sizing: inherit;
}
.container_hotel {
  display: block;
  padding: 2px;
}
.options {
  text-align: end;
}
.a {
  border: 1px solid blue;
}
</style>