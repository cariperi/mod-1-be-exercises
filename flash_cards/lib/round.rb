class Round
  attr_reader :deck, :turns
  attr_accessor :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, @current_card)
    @number_correct +=1 if current_turn.correct?
    @turns << current_turn
    pull_next_card
    current_turn
  end

  def pull_next_card  #come back to this
    @current_card = deck.cards[@turns.count] 
  end

  def number_correct_by_category(category)
    @turns.select{|turn| turn.card.answer == turn.guess && turn.card.category == category }.count
  end

  def percent_correct
    @number_correct.fdiv(@turns.count)*100
  end

  def percent_correct_by_category(category)
    number_correct = number_correct_by_category(category)
    total_category = @turns.select{|turn| turn.card.category == category}.count
    number_correct.fdiv(total_category)*100
  end
end
