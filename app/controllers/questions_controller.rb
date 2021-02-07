class QuestionsController < ApplicationController

  def random
    question  = QuestionService.new(session).random

    render json: {
      id: question.id,
      text: question.text,
      answers: question.answers
    }
  end
end
