require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'

card_1 = Card.new('What is the capital of New York?', 'Albany', :state_capitals)
card_2 = Card.new('What is the capital of Pennsylvania?', 'Harrisburg', :state_capitals)
card_3 = Card.new('Who was the first US President?', 'Washington', :presidents)
card_4 = Card.new('Who was the 16th US President?', 'Lincoln', :presidents)

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)

round = Round.new(deck)
round.start
