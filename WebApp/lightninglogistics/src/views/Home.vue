<template>
  <div class="home">
    <Table
      v-if="toRender == `main`"
      msg="Welcome to Your Vue.js App"
      @update-token="updatedToken()"
    />
    <Login
      v-if="toRender == `login`"
      msg="Welcome to Your Vue.js App"
      @update-token="updatedToken()"
    />
  </div>
</template>

<script>
// @ is an alias to /src
import Table from "@/components/Table.vue";
import Login from "@/components/Login.vue";
import jwt from "jsonwebtoken";

export default {
  name: "Home",
  components: {
    Table,
    Login,
  },
  data() {
    return {
      toRender: "",
    };
  },
  methods: {
    isValid: (token) => {
      if (token && jwt.decode(token)) {
        const expiry = jwt.decode(token).exp;
        const now = new Date();
        return now.getTime() < expiry * 1000;
      }
      return false;
    },
    // need to make the cookie system more robust
    updatedToken: function () {
      if (this.isValid(this.$cookies.get("token"))) {
        this.toRender = "main";
      } else {
        this.toRender = "login";
      }
    },
  },
  created() {
    if (!this.isValid(this.$cookies.get("token"))) {
      this.toRender = "login";
    } else {
      this.toRender = "main";
    }
  },
};
</script>
