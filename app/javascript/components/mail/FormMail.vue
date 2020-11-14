<template>
<div>
    <div class="reserve">
    <label for="start">date de la reservation:</label>
    <input
      type="date"
      id="start"
      value="2021-07-22"
      min="2020-01-01"
      required
      v-model="date"
    />
    <label for="appt">Heure :</label>
    <input type="time" id="appt"  required v-model="heure" />
    <button @click="send()" >Envoyer</button>
  </div>
  {{ message }}
</div>
  
</template>

<script>
import axios from 'axios'
export default {
    props:['hotel'],
    data(){
        return{
            date: '',
            heure:'',
            message: '',
        }
    },
    methods:{
         async send()  {
            if (this.date && this.heure) {
                const json = { date: this.date,heure: this.heure ,user: this.$store.state.user ,hotel:this.hotel }
                console.log(json)
                const res = await axios.post('http://127.0.0.1:3000/site/mail', json, {
                    headers: {
                        // Overwrite Axios's automatically set Content-Type
                        'Content-Type': 'application/json'
                    }
                })
                this.message = "Envoyer avec success"
                console.log("res",res)
            } else {
                this.message = "erreur"

                console('not send')
            }
        },
    }
};
</script>

<style>
.reserve{
    font-size: 30px;
    background-color: cadetblue;
}
</style>