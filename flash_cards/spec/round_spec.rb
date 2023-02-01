require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do

  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  describe '#initialize' do
    it 'is an instance of round' do
      expect(@round).to be_a Round
    end

    it 'has a deck' do
      expect(@round.deck).to eq(@deck)
    end

    it 'starts with an empty array of turns' do
      expect(@round.turns).to eq([])
    end

    it 'starts with the first card in the deck as the current card' do
      expect(@round.current_card).to eq(@card_1)
    end
  end

  describe '#take_turn' do
    it 'creates a new Turn object' do
      new_turn = @round.take_turn("Juneau")
      expect(new_turn).to be_a Turn
    end

    it 'returns true if the guess is correct' do
      new_turn = @round.take_turn("Juneau")
      expect(new_turn.correct?).to be true
    end

    it 'returns false if the guess is incorrect' do
      new_turn = @round.take_turn("Nova Scotia")
      expect(new_turn.correct?).to be false
    end

    it 'stores the number of correct guesses' do
      new_turn = @round.take_turn("Juneau")
      expect(@round.number_correct).to eq(1)
    end

    it 'does not increase the correct guess count if guess is incorrect' do
      new_turn = @round.take_turn("Nova Scotia")
      expect(@round.number_correct).to eq(0)
    end

    it 'adds a turn to the turns array' do
      new_turn = @round.take_turn("Juneau")
      expect(@round.turns.count).to eq(1)
      expect(@round.turns).to eq([new_turn])
    end

    it 'adds more than one turn to the turns array' do
      turn_1 = @round.take_turn("Juneau")
      turn_2 = @round.take_turn("Venus") 
      expect(@round.turns.count).to eq(2)
    end

    it 'advances to the next card in the deck' do
      new_turn = @round.take_turn("Juneau")
      expect(@round.current_card).to eq(@card_2)
    end

    it 'prints feedback based on the given guess' do
      turn_1 = @round.take_turn("Juneau")
      turn_2 = @round.take_turn("Venus")
      expect(@round.turns.last.feedback).to eq("Incorrect.")
    end
  end

  describe '#number_correct_by_category' do
    it 'returns the number of correct guesses in a given category' do
      turn_1 = @round.take_turn("Juneau")
      turn_2 = @round.take_turn("Venus")
      expect(@round.number_correct_by_category(:Geography)).to eq(1)
      expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end
  end

  describe '#percent_correct' do
    it 'returns the percent of correct guesses' do
      turn_1 = @round.take_turn("Juneau")
      turn_2 = @round.take_turn("Venus")
      expect(@round.percent_correct).to eq(50.0)
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns the percent of correct guesses in a given category' do
      turn_1 = @round.take_turn("Juneau")
      turn_2 = @round.take_turn("Venus")
      expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
  end 
end
