<template>
  <div class="kittens-show">
    <h2>{{ kitten.name }}</h2>
    <img v-bind:src="kitten.image" v-bind:alt="kitten.name" />
    <h2>{{ kitten.age }}</h2>
    <h2>{{ kitten.breed }}</h2>
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
  methods: {},
};
</script>