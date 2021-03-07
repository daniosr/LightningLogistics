<template>
  <div class="home">
    <Table msg="Welcome to Your Vue.js App" />
  </div>
</template>

<script>
// @ is an alias to /src
import Table from "@/components/Table.vue";

export default {
  name: "Home",
  components: {
    Table,
  },
};
</script>
