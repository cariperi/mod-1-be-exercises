require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  it 'exists' do
    turn = Turn.new("Portland", @card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Portland", @card)

    expect(turn.guess).to eq("Portland")
  end

  it 'has a current flashcard' do
    turn = Turn.new("Portland", @card)

    expect(turn.card).to eq(@card)
  end

  it 'returns false when guess is wrong' do
    turn = Turn.new("Portland", @card)

    expect(turn.correct?).to be false
  end

  it 'returns true when guess is right' do
    turn = Turn.new("Juneau", @card)

    expect(turn.correct?).to be true
  end

  it 'provides feedback on correct guesses' do
    turn = Turn.new("Juneau", @card)

    expect(turn.feedback).to eq("Correct!")
  end

  it 'provides feedback on incorrect guesses' do
    turn = Turn.new("Portland", @card)

    expect(turn.feedback).to eq("Incorrect.")
  end
end
