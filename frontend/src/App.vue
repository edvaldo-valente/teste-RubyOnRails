<template>
<div id="app">
  <v-app id="inspire">
    <v-card
      max-width="450"
      class="mx-auto"
    >
      <v-toolbar
        color="cyan"
        dark
      >
  
        <v-toolbar-title>Inbox</v-toolbar-title>
  
        <v-spacer></v-spacer>
  
      </v-toolbar>
      <div v-if="loading">
        <div class="text-center">
          <v-progress-circular
            indeterminate
            color="primary"
          ></v-progress-circular>
        </div>
      </div>
      <div v-else>  
        <div v-if="errored">
          {{ errored }}
        </div>
        <div v-else>
          <v-list three-line>
            <template v-for="(item, index) in users">
              <v-subheader
                v-if="item.header"
                :key="item.header"
                v-text="item.header"
              ></v-subheader>
      
              <v-divider
                v-else-if="item.divider"
                :key="index"
                :inset="item.inset"
              ></v-divider>
      
              <v-list-item
                v-else
                :key="item.title"
              >
                <v-list-item-avatar>
                  <v-img :src="item.avatar"></v-img>
                </v-list-item-avatar>
      
                <v-list-item-content>
                  <a v-bind:href="item.url">
                    <v-list-item-title v-html="item.login"></v-list-item-title>
                  </a>
                </v-list-item-content>
              </v-list-item>
            </template>
          </v-list>
        </div>
      </div>
      
    </v-card>
  </v-app>
</div>
</template>

<script>

export default {
  name: 'App',
  created() {
    this.getUsers()
  },
  mounted () {
    this.getUsers()
  },
  data: () => ({
    users: [],
    errored: false,
    loading: true
  }),
  methods: {
    getUsers () {
      this.axios.get('http://localhost:3000')
      .then(response => (
        this.loading = false,
        this.users = response.data.items.map(function (item) {
          return {
            avatar:item.avatar_url, 
            login: item.login,
            url:  item.url
          }
        }),
        console.log(this.users)
      ))
      .catch(error => {
        this.errored = error
      })
      .finally(() => this.loading = false)
    }
  }
}
</script>

<style scoped>
  .v-progress-circular {
    margin: 1rem;
  }
</style>