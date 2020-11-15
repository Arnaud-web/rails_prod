<template>
    <div>
        <div>
            <input type="text" placeholder="Commentaire" v-model="message" >
            <button @click="send()">Commenter</button>
        </div>
    </div>
</template>
<script>
import axios from 'axios'
export default {
    props:['hotel'],
    data(){
        return{
            message: ''
        }
    },
    methods:{
        async send() {
      if (this.message) {
        const json = {
          message: this.message,
          hotel: this.hotel.id,
          user: this.$store.state.user.id
        };
        const res = await axios.post("http://127.0.0.1:3000/v1/user_comment", json, {
          headers: {
            // Overwrite Axios's automatically set Content-Type
            "Content-Type": "application/json",
          },
        });
        console.log("res", res);
        this.data = res;
        if (this.data.data.id) {
          this.$store.state.comments.push(this.data.data)
           this.message = ''
        }
      } else {
        console("not send");
      }
    },
    }
}
</script>