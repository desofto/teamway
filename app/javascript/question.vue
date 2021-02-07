<template>
  <div v-if="question">
    <div>{{ question.text }}</div>

    <div>
      <ul>
        <li v-for="(text, index) in question.answers" :key="index">
          <input type="radio" v-model="answer" :value="index" />
          {{ text }}
        </li>
      </ul>
    </div>

    <div>
      <button @click="sendAnswer(question.id, answer)">Next &gt;</button>
    </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
      question: null,
      answer: null
    }),

    mounted() {
      this.$http.get('/questions/random').then(response => {
        this.question = response.body
      })
    },

    methods: {
      sendAnswer(question_id, answer) {
        this.$http.put('/quizes', {
          question_id: question_id,
          answer: answer
        }).then(response => {
          this.$emit('update-progress')
        })
      }
    }
  }
</script>

<style lang="scss" scoped>
  ul {
    padding-inline-start: 0;

    li {
      margin-bottom: .3em;
    }
  }
</style>