class QuestionService
  class NoMoreQuestions < StandardError; end

  def initialize(session)
    @session = session
  end

  def random
    session[:answers] ||= {}

    raise NoMoreQuestions unless session[:answers].count < Question.questions.count

    question_id = nil
    loop do
      question_id = rand(Question.questions.count)
      break unless session[:answers][question_id]
    end

    session[:answers][question_id] = nil

    Question.questions[question_id]
  end

  private

  attr_reader :session
end