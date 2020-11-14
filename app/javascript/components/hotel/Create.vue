<template>
  <div>
    <div>
      <a class="text_hotel" @click="showFormulaire = !showFormulaire"
        >Cree un Hotel</a
      >
    </div>
    <div v-if="showFormulaire">
      <input type="text" placeholder="Nom de l'Hotel" v-model="name" />
      <input type="text" placeholder="Specialite" v-model="specialty" />
      <input type="text" placeholder="Address" v-model="adress" />
      <input type="text" placeholder="Prix" v-model="prix" />
      <input
        type="text"
        placeholder="Url de l'Image de l'Hotel"
        v-model="photo"
      />
      <button @click="save()">Save</button>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      showFormulaire: false,
      name: "",
      specialty: "",
      prix: "",
      photo: "",
      adress: '',
      data:''
    };
  },
  computed: {},
  methods: {
    async save() {
      if (this.name && this.specialty && this.prix && this.photo && this.adress) {
        const json = {
          name: this.name,
          specialty: this.specialty,
          prix: this.prix,
          photo: this.photo,
          adress: this.adress
        };
        const res = await axios.post("http://127.0.0.1:3000//v1/hotels", json, {
          headers: {
            // Overwrite Axios's automatically set Content-Type
            "Content-Type": "application/json",
          },
        });
        console.log("res", res);
        this.data = res;
        if (this.data.data.id) {
          this.$store.state.hotels.push(this.data.data)
           this.name = '',
          this.specialty ='',
          this.prix = '',
          this.photo = '',
          this.adress='',
          this.showFormulaire = !this.showFormulaire
        }
      } else {
        console("not send");
      }
    },
  },
};
</script>

<style>
.text_hotel {
  font-size: 18px;
}
</style>