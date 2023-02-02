require_relative 'card'

class CardGenerator
  attr_reader :file, :file_data, :cards

  def initialize(filename)
    @file = File.open(filename)
    @file_data = @file.read.split("\n").map{|string|string.split(",")}
    @cards = create_cards(@file_data)
  end

  def create_cards(data_array)
    data_array.map {|card_data| Card.new(card_data[0], card_data[1], card_data[2]) }
  end
end
