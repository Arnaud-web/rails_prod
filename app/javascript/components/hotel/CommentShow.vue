<template>
    <div class="coms" >
        <label for="com">Commentaires :</label>
        <div id="com" v-for="(comment,index) in comments" :key="index" >
            <p class="text" > {{comment.message}} </p>
        </div>
        <p></p>
    </div>
</template>

<script>
export default {
    props:['hotel'],
    computed: {
        comments(){
            const coms = this.$store.state.comments
            const comsH = coms.filter((com)=>{
                return com.hotel_id === this.hotel.id
            })
            return comsH
        }

    },
}
</script>

<style>
    .coms{
        font-size: 12px;
        background-color:rgb(221, 214, 208);
        color: rgb(109, 108, 108);
        display: block;
        text-align: left;
    }
    .text{
        background-color: seashell;
    }
</style>