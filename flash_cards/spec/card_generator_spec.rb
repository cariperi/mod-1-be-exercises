require 'rspec'
require './lib/card_generator'

describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      filename = "cards.txt"
      card_generator = CardGenerator.new(filename)

      expect(card_generator).to be_a CardGenerator
    end

    it 'creates a new file object' do
      filename = "cards.txt"
      card_generator = CardGenerator.new(filename)

      expect(card_generator.file.class).to eq(File)
    end

    it 'reads data from the file to an array with sub arrays for each card' do
      filename = "cards.txt"
      card_generator = CardGenerator.new(filename)

      expect(card_generator.file_data.class).to eq(Array)
      expect(card_generator.file_data.count).to eq(4)
    end

    it 'creates a Card object for each card in the file' do
      filename = "cards.txt"
      card_generator = CardGenerator.new(filename)

      expect(card_generator.cards.class).to eq(Array)
      expect(card_generator.cards[0]).to be_a Card
      expect(card_generator.cards.count).to eq(4)
    end

    it 'assigns the correct arguments for the cards' do
      filename = "cards.txt"
      card_generator = CardGenerator.new(filename)

      expect(card_generator.cards[0].question).to eq('What is 5 + 5?')
      expect(card_generator.cards[0].answer).to eq('10')
      expect(card_generator.cards[0].category).to eq('STEM')
    end
  end
end