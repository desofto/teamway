class QuizResultService
  attr_reader :score

  def initialize(score)
    @score = score
  end

  def title
    score > 8 ? 'Introvert' : 'Extravert'
  end

  def description
    'Some description'
  end
end