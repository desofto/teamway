class QuizService
  QUESTIONS = 4

  def initialize(session)
    @session = session
  end

  def clear
    session[:answers] = {}
  end

  def answers
    session[:answers].values.compact
  end

  def score
    answers.sum
  end

  def answer(question_id, answer)
    if session[:answers].keys.include? question_id.to_s
      session[:answers][question_id.to_s] = Question.new(question_id).score(answer)
    end
  end

  private

  attr_reader :session
end