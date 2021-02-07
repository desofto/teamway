<template>
  <div v-if="ready">
    <div v-if="step < total">
      <p>{{ 1 + step }} / {{ total }}</p>
      <Question  @update-progress="updateProgress()" />
    </div>

    <Result v-else @update-progress="updateProgress()" />
  </div>
</template>

<script>
  import Question from './question'
  import Result from './result'

  export default {
    data: () => ({
      ready: false,
      step: 0,
      total: 0
    }),

    mounted() {
      this.updateProgress()
    },

    methods: {
      updateProgress() {
        this.ready = false
        this.$http.get('/quizes/progress').then(response => {
          this.step = response.body.current
          this.total = response.body.total
          this.ready = true
        })
      }
    },

    components: {
      Question,
      Result,
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
