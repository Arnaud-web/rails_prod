<template>
  <div id="app" class="body_h">
    <div v-show="showH">
      <p>{{ message }}</p>
      <div>
        <input
          type="text"
          placeholder="Search"
          v-model="search"
          @change="hotelsFilter"
        />
        <span v-if="search != ''" class="resulta">
          {{ hotelsFilter().length }} resultats{{
            hotelsFilter().length > 1 ? "s" : ""
          }}
        </span>
      </div>
      <div
        class="list_hotel"
        v-for="(hotel, index) in hotelsFilter()"
        :key="index"
      >
        <div style="display: inline-flex">
          <div>
            <Hotel :hotel="hotel" />
            <div class="btn_options">
              <button class="btn btn-sm btn-info" @click="show(hotel)">
                show
              </button>
              <!-- <a class="btn btn" @click="addToCart(hotel)">
          reserve
          </a> -->
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-if="showH == false">
      <ShowHotel :hotel="hotel" />
      <div class="btn_options">
        <button class="btn btn-sm btn-info" @click="show(hotel)">Listes Hotels</button>
        <!-- <a class="btn btn" @click="addToCart(hotel)">
          reserve
          </a> -->
      </div>
    </div>
  </div>
</template>

<script>
import ShowHotel from "./components/ShowHotel";
import axios from "axios";
import Hotel from "./components/Hotel";
export default {
  data: function () {
    return {
      message: "Hello Word",
      hotels: [],
      showH: true,
      search: "",
      hotel: "",
    };
  },
  components: {
    Hotel,
    ShowHotel,
  },
  methods: {
    hotelsFilter() {
      console.log(this.search, this.hotels);
      var _hotels = this.hotels;
      if (this.search != "") {
        _hotels = this.hotels.filter((hotel) => {
          return hotel.name.toLowerCase().includes(this.search);
        });
        console.log("recherche", _hotels);
        return _hotels;
      } else {
        return this.hotels;
      }
    },

    show(hotel) {
      this.hotel = hotel;
      this.showH = !this.showH;
    },
  },
  mounted() {
    axios
      .get("http://127.0.0.1:3000/v1/hotels")
      .then((response) => {
        this.hotels = response.data;
        console.log(response.data);
      })
      .catch((error) => {
        console.log(error);
        this.errored = true;
      });
  },
};
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
.resulta {
  padding-left: 12px;
  color: gray;
  font-size: 18px;
}
.btn_options {
  background-color: grey;
  margin-left: 2px;
  margin-right: 2px;
  text-align: end;
}.body_h{
  margin: 20px;
}
</style>
