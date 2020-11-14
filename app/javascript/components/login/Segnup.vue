<template>
  <div class="segnup">
    <input type="text" placeholder="Email" v-model="email" />
    <input type="text" placeholder="Role" v-model="role" />
    <input type="text" placeholder="Password" v-model="password" />
    <button @click="send()">Cree un Compte</button>
  </div>
</template>
<script>
import { mapActions } from "vuex";

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
    send() {
      const json = {
        email: this.email,
        role: this.role,
        password: this.password,
        id: 5
      };

      this.setUser(json);
    },
  },
};
</script>

<style>
.segnup {
  text-align: center;
}
</style>