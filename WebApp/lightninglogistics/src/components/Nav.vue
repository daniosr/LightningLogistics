<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Lightning Logistics</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#"
              >Generate Report</a
            >
          </li>
        </ul>
        <a class="nav-link" href="#" v-on:click="logout"> Logout </a>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: "Nav",
  methods: {
    logout: function () {
      this.$emit("logout");
    },
  },
};
</script>