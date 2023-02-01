class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    selected_cards = []
    @cards.each do |card|
      selected_cards << card if category == card.category
    end
    selected_cards
  end
end
