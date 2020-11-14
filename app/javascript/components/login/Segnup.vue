<template>
  <div class="segnup">
    <label for="pet-select">Options:</label>
    <select v-model="role" name="pets" id="pet-select">
      <option value="client">Client</option>
      <option value="hotel">Hotel</option>
    </select>
    <input type="text" placeholder="Email" v-model="email" />
    <!-- <input type="text" placeholder="Role" v-model="role" /> -->

    <input type="text" placeholder="Password" v-model="password" />
    <button @click="send()">Cree un Compte</button>
  </div>
</template>
<script>
import { mapActions } from "vuex";
import axios from "axios";
export default {
  data() {
    return {
      email: "",
      role: "",
      password: "",
    };
  },
  methods: {
    ...mapActions({
      setUser: "setUser",
    }),

    async send() {
      console.log(this.email, this.password);
      if (this.password && this.email) {
        const json = {
          email: this.email,
          role: this.role,
          password: this.password
        };
        const res = await axios.post("http://127.0.0.1:3000/v1/users", json, {
          headers: {
            // Overwrite Axios's automatically set Content-Type
            "Content-Type": "application/json",
          },
        });

        console.log("res", res);
        this.data = res;
        if (this.data.data.id) {
          this.setUser(this.data.data);
        }
      } else {
        console("not send");
      }
    },
  },
};
</script>

<style>
.segnup {
  text-align: center;
}
</style>