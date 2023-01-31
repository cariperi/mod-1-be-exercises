require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Portland", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Portland", card)

    expect(turn.guess).to eq("Portland")
  end

  it 'has a current flashcard' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Portland", card)

    expect(turn.card).to eq(card)
  end

  it 'returns false when guess is wrong' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Portland", card)

    expect(turn.correct?).to be false
  end

  it 'returns true when guess is right' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to be true
  end

  it 'provides feedback on guesses' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_correct = Turn.new("Juneau", card)
    turn_incorrect = Turn.new("Portland", card)

    expect(turn_correct.feedback).to eq("Correct!")
    expect(turn_incorrect.feedback).to eq("Incorrect.")
  end
end
