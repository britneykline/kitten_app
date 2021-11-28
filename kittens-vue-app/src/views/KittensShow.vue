<template>
  <div class="kittens-show">
    <h2>{{ kitten.name }}</h2>
    <img v-bind:src="kitten.image" v-bind:class="image-thumbnail" v-bind:alt="kitten.name" />
    <h2>Age: {{ kitten.age }}</h2>
    <h2>Breed: {{ kitten.breed }}</h2>
    <router-link v-bind:to="`/kittens/${kitten.id}/edit`">Edit Kitten</router-link> |
    <button v-on:click="destroyKitten(kitten)">Delete Kitten</button> |
    <router-link to="/kittens">Back to all Kittens</router-link>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      kitten: {},
    };
  },
  created: function () {
    axios.get("/kittens/" + this.$route.params.id).then((response) => {
      console.log("kittens show", response);
      this.kitten = response.data;
    });
  },
  methods: {
    destroyKitten: function (kitten) {
      axios.delete("/kittens/" + kitten.id).then((response) => {
        console.log("kittens destroy", response);
        this.$router.push("/kittens");
      });
    },
  },
};
</script>