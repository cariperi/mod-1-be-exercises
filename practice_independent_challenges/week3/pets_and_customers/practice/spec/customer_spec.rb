require 'rspec'
require './lib/pet'
require './lib/customer'

describe Customer do
  before(:each) do
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@joel).to be_a Customer
    end

    it 'has a name' do
      expect(@joel.name).to eq("Joel")
    end

    it 'has an id' do
      expect(@joel.id).to eq(2)
    end

    it 'has no pets when created' do
      expect(@joel.pets).to eq([])
    end

    it 'starts with no outstanding balance' do
      expect(@joel.outstanding_balance).to eq(0)
    end
  end

  describe '#adopt' do
    it 'can add a pet to a customer' do
      @joel.adopt(@samson)

      expect(@joel.pets).to eq([@samson])
      expect(@joel.pets.count).to eq(1)
    end

    it 'can add multiple pets' do
      @joel.adopt(@samson)
      @joel.adopt(@lucy)

      expect(@joel.pets).to eq([@samson, @lucy])
      expect(@joel.pets.count).to eq(2)
    end
  end

  describe '#charge' do
    it 'can add value to an outstanding balance' do
      expect(@joel.outstanding_balance).to eq(0)

      @joel.charge(15)

      expect(@joel.outstanding_balance).to eq(15)
    end

    it 'can add value multiple times' do
      expect(@joel.outstanding_balance).to eq(0)

      @joel.charge(15)
      @joel.charge(7)

      expect(@joel.outstanding_balance).to eq(22)
    end
  end
end
