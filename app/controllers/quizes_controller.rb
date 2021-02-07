class QuizesController < ApplicationController
  def index
  end

  def create
    service.clear

    render json: :ok
  end

  def result
    if service.answers.count < QuizService::QUESTIONS
      render json: 'In progress'
      return
    end

    score = service.answers.sum

    render json: {
      score: score,
      title: score > 8 ? 'Introvert' : 'Extravert',
      description: 'Some description'
    }
  end

  def update
    question_id = params[:question_id]
    answer = params[:answer]
    service.answer(question_id, answer)

    render json: :ok
  end

  def progress
    render json: {
      current: service.answers.count,
      total: QuizService::QUESTIONS
    }
  end

  private

  def service
    @service ||= QuizService.new(session)
  end
end
