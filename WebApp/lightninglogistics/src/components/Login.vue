<template>
  <div class="container mt-5">
    <form onsubmit="return false">
      <div class="mb-3">
        <label class="form-label">Password</label>
        <input
          type="password"
          class="form-control"
          id="exampleInputPassword1"
          v-model="password"
        />
      </div>
      <button class="btn btn-primary" v-on:click="attemptLogin">Submit</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Login",
  data: function () {
    return {
      password: "",
    };
  },
  methods: {
    attemptLogin: function () {
      axios
        .post("http://api.lightninglogistics.co.uk/api/auth", {
          passwordString: this.password,
        })
        .then((response) => {
          this.$cookies.set("token", response.data);
          this.$emit("update-token");
        });
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
