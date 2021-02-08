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

    result = QuizResultService.new(service.score)

    render json: {
      score: result.score,
      title: result.title,
      description: result.description
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
