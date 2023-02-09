require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do

  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@deck).to be_a Deck
    end

    it 'has an array of cards' do
      expect(@deck.cards).to eq(@cards)
    end
  end

  it 'returns the number of cards in the deck' do
    expect(@deck.count).to eq(3)
  end

  describe '#cards_in_category' do
    it 'returns cards based on a given category' do
      expect(@deck.cards_in_category(:STEM)).to include(@card_2, @card_3)
    end

    it 'does not return cards that are not in the given category' do
      expect(@deck.cards_in_category(:STEM)).not_to include(@card_1)
    end
  end
end
