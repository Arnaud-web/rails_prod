<template>
  <div id="app" class="login">
      
    <input type="text" placeholder="Email" v-model="email" />
    <input type="text" placeholder="role" v-model="role" />
    <input type="password" placeholder="Mots de pass" v-model="password" />
    <button @click="connect()">Cree un Compte</button>
    {{ datas.data }}
    <p class="error" > {{  datas.data ? datas.data.error : '' }} </p>
  </div>
</template>

<script>
import Vuex, { mapActions } from 'vuex'
import axios from 'axios'
export default {
    data(){
        return {
            email: '',
            password: '',
            role: '',
            data: []
        }
    },
    computed:{
        datas(){
            return this.data
        }
    },
    methods:{
        ...mapActions({
            setUser :'setUser'
        }
        ),
        async connect()  {
            // console.log(this.email,this.password)
            // if (this.password && this.email) {
            //     const json = { email: this.email,password: this.password }
            //     const res = await axios.post('http://127.0.0.1:3000/v1/users/login', json, {
            //         headers: {
            //             // Overwrite Axios's automatically set Content-Type
            //             'Content-Type': 'application/json'
            //         }
            //     })

            //     console.log("res",res)
            //     this.data = res
            //     if (this.data.data.id) {
            //         this.setUser(this.data.data)
            //     }
            // } else {
            //     console('not send')
            // }
        },
        setStore(){
            // store.actions.setUser(this.data.data)
        }
    }
    
}
</script>

<style>
.login {
  text-align: center;
}
</style>