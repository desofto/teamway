require 'rails_helper'

describe QuizResultService do
  it 'returns "Introvert"' do
    service = QuizResultService.new(9)

    expect(service.title).to eq 'Introvert'
  end

  it 'returns "Extravert"' do
    service = QuizResultService.new(1)

    expect(service.title).to eq 'Extravert'
  end

  it 'fails on wrong score' do
    service = QuizResultService.new(nil)

    expect { service.title }.to raise_error NoMethodError
  end
end