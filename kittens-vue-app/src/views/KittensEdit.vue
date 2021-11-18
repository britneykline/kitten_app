<template>
  <div class="kittens-edit">
    <h1>Edit Kitten</h1>
    <form v-on:submit.prevent="updateKitten(kitten)">
      <ul>
        <li v-for="error in errors" v-bind:key="error">{{ error }}</li>
      </ul>
      Name:
      <input type="text" v-model="kitten.name" />
      Breed:
      <input type="text" v-model="kitten.breed" />
      Age:
      <input type="text" v-model="kitten.age" />
      Image:
      <input type="text" v-model="kitten.image" />
      <input type="submit" value="Update" />
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      kitten: {},
      errors: [],
    };
  },
  created: function () {
    axios.get("/kittens/" + this.$route.params.id).then((response) => {
      console.log("kittens show", response);
      this.kitten = response.data;
    });
  },
  methods: {
    updateKitten: function (kitten) {
      var editKittenParams = kitten;
      axios
        .patch("/kittens/" + kitten.id, editKittenParams)
        .then((response) => {
          console.log("kitten update", response);
          this.$router.push("/kittens");
        })
        .catch((error) => {
          console.log("kittens update error", error.response);
          this.errors = error.response.data.errors;
        });
    },
  },
};
</script>