<template>
  <div style="text-align: center;margin: 20px">
    <div class="container_h">
      <div class="h">
        <p class="name_h">{{ hotel.name }}</p>
        <span class="o">{{ hotel.adress }}</span>
        <span class="o">{{ hotel.specialty }}</span>
        <img
          class="image_h"
          :src="hotel.photo"
          :alt="'image100x100 ' + hotel.photo"
        />
        <span class="prix">{{ hotel.prix }} $</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["hotel"],
};
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
.image_h {
  background-color: grey;

  vertical-align: middle;
  font-family: Verdana, sans-serif;
  font-size: 15px;
  line-height: 1.5;
  color: #000 !important;
  box-sizing: inherit;
  border-style: none;
  vertical-align: middle;
  height: auto;
}.prix{
    display: block;
    color: lawngreen;
    font-size: 20px;
}
.name_h {
  display: block;
  background-color: rgb(110, 110, 110);

  text-align: center;
  font-family: Verdana, sans-serif;
  font-size: 20px;
  line-height: 1.5;
  color: rgb(252, 252, 252) !important;
  box-sizing: inherit;
}
.container_hotel {
  display: block;
  padding: 2px;
}
.o {
  display: block;
  text-align: center;
}
.a {
  border: 1px solid blue;
}
</style>