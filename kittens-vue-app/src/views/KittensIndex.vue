<template>
  <div class="kittens-index">
    <h1>All Kittens</h1>
    <br></br>
    <hr></hr>
    <br></br>
    <div class="row">
        search: <input type="text" v-model="searchTerm">
      <div class="col-sm-4" v-for="kitten in filterBy(kittens, searchTerm, 'name')">
        <div class="card">
          <img v-bind:src="kitten.image" class="card-img-top"  v-bind:alt="kitten.name" /></p>
         <div class="card-body">
           <h5 class="card-title">{{ kitten.name }}</h5>
           <p class="card-text">{{kitten.breed | uppercase }}.</p>
           <a v-bind:href="`/kittens/${kitten.id}`" class="btn btn-primary">More Info</a>
         </div>
        </div>
      <br></br>
      <hr></hr>
      <br></br>
    </div>
  </div>
  </div>
</template>

<script>
import axios from "axios"
import Vue2Filters from 'vue2-filters'

export default {
  mixins: [Vue2Filters.mixin],
  data: function () {
    return {
      kittens: {
        image: "",
        thumbnail: "",
      },
      searchTerm: "",
    };
  },
  created: function () {
    this.indexKittens();
  },
  methods: {
    indexKittens: function () {
      console.log('in kittens index...')
      axios.get("/kittens").then((response => {
        console.log(response.data);
        this.kittens = response.data;
      })
    }
  },
};
</script>