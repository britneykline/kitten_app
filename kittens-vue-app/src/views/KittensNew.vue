<template>
  <div class="kittens-new">
    <h1>New Kitten</h1>
    <form v-on:submit.prevent="createKitten()">
      <ul>
        <li v-for="error in errors" v-bind:key="error">{{ error }}</li>
      </ul>
      <p>Name:
      <input type="text" v-model="newKittenParams.name" /></p>
      <p>Breed:
      <input type="text" v-model="newKittenParams.breed" /></p>
      <p>Age:
      <input type="text" v-model="newKittenParams.age" /></p>
      <p>Image:
      <input type="text" v-model="newKittenParams.image" /></p>
      <p><input type="submit" value="Create" /></p>
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      newKittenParams: {},
      errors: [],
    };
  },
  created: function () {},
  methods: {
    createKitten: function () {
      axios
        .post("/kittens", this.newKittenParams)
        .then((response) => {
          console.log("kittens create", response);
          this.$router.push("/kittens");
        })
        .catch((error) => {
          console.log("kittens create error", error.response);
          this.errors = error.response.data.errors;
        });
    },
  },
};
</script>