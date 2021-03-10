<template>
  <div>
    <Nav @logout="logout" />
    <div class="container">
      <table class="table-responsive table">
        <thead>
          <tr>
            <th scope="col">BTWD</th>
            <th scope="col">Reference</th>
            <th scope="col">Sales Order Reference</th>
            <th scope="col">Location</th>
            <th scope="col">Weight</th>
            <th scope="col">Date Recieved</th>
            <th scope="col">Price</th>
          </tr>
        </thead>
        <tbody v-for="item in items" :key="item.itemID">
          <tr>
            <td scope="row">{{ item.btwd }}</td>
            <td scope="row">{{ item.reference }}</td>
            <td scope="row">{{ item.salesOrderReference }}</td>
            <td scope="row">{{ item.location }} - {{ item.subLocation }}</td>
            <td scope="row">{{ item.weight }}</td>
            <td scope="row">{{ item.dateRecieved }}</td>
            <td scope="row">{{ item.price }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Nav from "@/components/Nav.vue";

export default {
  name: "Table",
  components: {
    Nav,
  },
  data: function () {
    return {
      items: {},
    };
  },
  methods: {
    getItems: function () {
      axios
        .get("http://api.lightninglogistics.co.uk/api/item", {
          headers: { Authorization: "Bearer " + this.$cookies.get("token") },
        })
        .then((response) => {
          this.items = response.data;
        });
    },
    logout: function () {
      this.$cookies.set("token", "");
      this.$emit("update-token");
    },
  },
  created() {
    this.getItems();
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
