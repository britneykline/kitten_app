<template>
  <div class="kittens-index">
    <h1>All Kittens</h1>
    <div v-for="kitten in kittens" v-bind:key="kitten.id">
      <h2>{{ kitten.name }}</h2>
      <img v-bind:src="kitten.image" v-bind:alt="kitten.name" />
      <router-link v-bind:to="`/kittens/${kitten.id}`">More Details</router-link>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      kittens: [],
    };
  },
  created: function () {
    this.indexKittens();
  },
  methods: {
    indexKittens: function () {
      axios.get("/kittens").then((response) => {
        console.log("kittens index", response);
        this.kittens = response.data;
      });
    },
  },
};
</script>