<template>
  <div id="app" class="body_h">
    <div v-show="showH">
      <p>{{ message }}</p>
      <div v-if="!showLogin()">
        <Create v-if="this.$store.state.user.role == 'hotel'" />
      </div>
      <LoginApp v-show="!showC" v-if="showLogin()" />
      {{ this.$store.state.user }}
      <div v-if="!showLogin()">
        <a @click="deconnect()">Déconnecter</a>
      </div>
      <div v-show="showLogin()">
        <a class="" @click="showC = !showC">{{
          !showC ? "Cree un Compte" : "se Connecté"
        }}</a>
        <Segnup v-show="showC" />
      </div>
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
              <!-- <v-btn
                v-if="!showLogin()"
                class="btn btn-sm btn-info"
                @click="showFormEmail = !showFormEmail"
              >
                Reservé
              </v-btn> -->
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
        <!-- <a class="btn btn" @click="addToCart(hotel)">
          reserve
          </a> -->
        <button
          v-if="!showLogin()"
          class="btn btn-sm btn-info"
          @click="showFormEmail = !showFormEmail"
        >
          Reservé
        </button>
        <button class="btn btn-sm btn-info" @click="show(hotel)">
          Listes Hotels
        </button>
      </div>
      <div v-if="showFormEmail">
        <FormMail :hotel="hotel" />
      </div>
      <div>
        <CommentShow :hotel="hotel" />
      </div>
      <div v-if="!showLogin()">
        <Comments :hotel="hotel" />
      </div>
    </div>
  </div>
</template>

<script>
import ShowHotel from "./components/ShowHotel";
import axios from "axios";
import Hotel from "./components/Hotel";
import LoginApp from "./components/login/LoginApp";
import Segnup from "./components/login/Segnup";
import Create from "./components/hotel/Create";
import FormMail from "./components/mail/FormMail";
import Comments from "./components/hotel/Comments";
import CommentShow from "./components/hotel/CommentShow";
export default {
  data: function () {
    return {
      message: "Hello Word",
      hotels: [],
      showH: true,
      search: "",
      showC: false,
      hotel: "",
      showFormEmail: false,
    };
  },
  components: {
    Hotel,
    ShowHotel,
    LoginApp,
    Segnup,
    Create,
    FormMail,
    Comments,
    CommentShow,
  },
  computed: {},
  methods: {
    showLogin() {
      if (this.$store.state.user.id) {
        return false;
      } else {
        return true;
      }
    },

    hotelsFilter() {
      console.log(this.search, this.hotels);
      var _hotels = this.$store.state.hotels;
      if (this.search != "") {
        _hotels = this.hotels.filter((hotel) => {
          return hotel.name.toLowerCase().includes(this.search);
        });
        console.log("recherche", _hotels);
        return _hotels;
      } else {
        return _hotels;
      }
    },
    reserver(hotel) {
      console.log(hotel);
    },
    show(hotel) {
      this.hotel = hotel;
      this.showH = !this.showH;
    },
    get() {
      let cookieValue = this.$cookies.get("user");
      if (cookieValue) {
        this.$store.state.user = cookieValue;
      }
      console.log("cookies", cookieValue);
    },
    deconnect() {
      this.$store.state.user = [];
      this.$cookies.remove("user");
    },
  },
  mounted() {
    axios
      .get("http://127.0.0.1:3000/v1/hotels")
      .then((response) => {
        this.hotels = response.data;
        this.$store.state.hotels = response.data;
        console.log(response.data);
        console.log("store", this.$store.state.hotels);
      })
      .catch((error) => {
        console.log(error);
        this.errored = true;
      });
    axios
      .get("http://127.0.0.1:3000/v1/user_comment")
      .then((response) => {
        // this.hotels = response.data;
        this.$store.state.comments = response.data;
        console.log(response.data);
        console.log("comments", this.$store.state.comments);
      })
      .catch((error) => {
        console.log(error);
        this.errored = true;
      });
    this.get();
    // console.log('cook',this.$cookies)
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
}
.body_h {
  margin: 20px;
  text-align: center;
}
</style>
