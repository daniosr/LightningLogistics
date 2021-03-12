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
            <th scope="col">Remove</th>
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
            <td scope="row">
              <a href="#">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  fill="red"
                  class="bi bi-trash-fill"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"
                  />
                </svg>
              </a>
            </td>
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
