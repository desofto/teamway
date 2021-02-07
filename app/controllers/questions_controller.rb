class QuestionsController < ApplicationController

  def random
    question  = QuestionService.new(session).random

    render json: {
      text: question[0],
      answers: question[1]
    }
  end
end
