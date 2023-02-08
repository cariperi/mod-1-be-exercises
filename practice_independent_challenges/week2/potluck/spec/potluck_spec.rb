require 'rspec'
require './lib/dish'
require './lib/potluck'

describe Potluck do

  describe '#initialize' do
    it 'exists' do
      potluck = Potluck.new("7-13-18")
      expect(potluck).to be_a Potluck
    end

    it 'has a date' do
      potluck = Potluck.new("7-13-18")
      expect(potluck.date).to eq("7-13-18")
    end

    it 'has a dishes array that is empty by default' do
      potluck = Potluck.new("7-13-18")
      expect(potluck.dishes).to eq([])
    end
  end

  describe '#add_dish' do
    it 'adds a dish to the end of the dishes array' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes).to include(couscous_salad, cocktail_meatballs)
      expect(potluck.dishes.length).to eq(2)
    end
  end
end
