<template>
  <div id="app">
    <p>{{ message }}</p>
    <div class="list_hotel" v-for="(hotel, index) in hotels" :key="index" >
      <Hotel :hotel = "hotel" />
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Hotel from './components/Hotel'
export default {
  data: function () {
    return {
      message: "Hello Vue God!",
      hotels:[]
    }
  },
  components:{
    Hotel
  },
  mounted () {
    axios
      .get('http://127.0.0.1:3000/v1/hotels')
      .then(response => {
        this.hotels = response.data
        console.log(response.data)
      })
      .catch(error => {
        console.log(error)
        this.errored = true
      })
  }

}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.list_hotel {
  font-family: Verdana, sans-serif;
  font-size: 15px;
  line-height: 1.5;
  color: #000 !important;
  box-sizing: inherit;
  float: left;
  /* width: 33%; */
  display: contents;
}
</style>
