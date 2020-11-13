<template>
  <div id="app">
    <p>{{ message }}</p>
    <div v-for="(hotel, index) in hotels" :key="index" >
      {{ hotel.name }}
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      message: "Hello Vue God!",
      hotels:[]
    }
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
</style>
