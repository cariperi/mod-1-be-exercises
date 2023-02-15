require 'rspec'
require './lib/pet'

describe Pet do
  before(:each) do
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@samson).to be_a Pet
    end

    it 'has a name' do
      expect(@samson.name).to eq("Samson")
    end

    it 'has a type' do
      expect(@samson.type).to eq(:dog)
    end

    it 'has an age' do
      expect(@samson.age).to eq(3)
    end
  end

  describe '#fed?' do
    it 'starts out false' do
      expect(@samson.fed?).to be false
    end

    it 'can return true if the pet is fed' do
      @samson.feed
      expect(@samson.fed?).to be true
    end
  end

  describe '#feed' do
    it 'can make the pet fed' do
      expect(@samson.fed?).to be false

      @samson.feed

      expect(@samson.fed?).to be true
    end
  end

end