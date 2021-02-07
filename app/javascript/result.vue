<template>
  <div v-if="result">
    <div>Score: {{ result.score }}</div>
    <div>Means: {{ result.title }}</div>
    <div>
      <p>{{ result.description }}</p>
    </div>
    <div>
      <button @click="runOver()">Run over</button>
    </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
      result: null
    }),

    mounted() {
      this.loadResult()
    },

    methods: {
      loadResult() {
        this.$http.get('/quizes/result').then(response => {
          this.result = response.body
        })
      },

      runOver() {
        this.$http.post('/quizes').then(response => {
          this.$emit('update-progress')
        })
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>