class QuizesController < ApplicationController
  QUESTIONS = 4

  def index
  end

  def create
    session[:answers] ||= {}

    render json: :ok
  end

  def show
    return if session[:answers].values.compact.count < QUESTIONS

    score = session[:answers].values.compact.sum

    render json: {
      score: session[:answers].values.compact.sum,
      title: score > 8 ? 'Introvert' : 'Extravert',
      description: 'Some description'
    }
  end

  def update
    question_id = params[:question_id]
    answer = params[:answer]

    if session[:answers].keys.include? question_id
      session[:answers][question_id] = question[question_id][answer]
    end

    render json: :ok
  end

  def progress
    render json: {
      current: session[:answers].values.compact.count,
      total: QUESTIONS
    }
  end
end
