class QuestionService
  class NoMoreQuestions < StandardError; end

  QuestionRecord = Struct.new(:id, :text, :answers)

  def initialize(session)
    @session = session
  end

  def random
    session[:answers] ||= {}

    question_id = session[:answers].keys.last

    if !question_id || session[:answers][question_id.to_s]
      raise NoMoreQuestions unless session[:answers].count < ::Question.questions.count

      question_id = nil
      loop do
        question_id = rand(::Question.questions.count)
        break unless session[:answers][question_id]
      end

      session[:answers][question_id] = nil
    end

    question = ::Question.questions[question_id.to_i]

    QuestionRecord.new(question_id, question[0], question[1].map(&:first))
  end

  private

  attr_reader :session
end