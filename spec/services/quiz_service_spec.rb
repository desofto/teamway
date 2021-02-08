require 'rails_helper'

describe QuizService do
  let(:session) { { answers: { "1" => 2, "2" => 3, "3" => 4, "5" => nil } } }
  let(:service) { QuizService.new(session) }

  it '#clear' do
    service.clear

    expect(session[:answers]).to eq ({})
  end

  it '#answers' do
    expect(service.answers).to match_array [2, 4, 3]
  end

  it '#score' do
    expect(service.score).to eq 9
  end

  context '#answer' do
    it 'stores answer for correct question_id' do
      service.answer("5", 0)

      expect(session[:answers]).to eq ({ "1" => 2, "2" => 3, "3" => 4, "5" => 1 })
    end

    it 'does not change on incorrect question_id' do
      service.answer("7", 0)

      expect(session[:answers]).to eq ({ "1" => 2, "2" => 3, "3" => 4, "5" => nil })
    end
  end
end