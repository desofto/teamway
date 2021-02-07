class QuizService
  QUESTIONS = 4

  def initialize(session)
    @session = session
  end

  def clear
    session[:answers] ||= {}
  end

  def answers
    session[:answers].values.compact
  end

  def answer(question_id, answer)
    if session[:answers].keys.include? question_id
      session[:answers][question_id] = Question.questions[question_id][2][answer]
    end
  end

  private

  attr_reader :session
end