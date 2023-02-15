require 'rspec'
require './lib/pet'
require './lib/customer'
require './lib/day_care'

describe DayCare do
  before(:each) do
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @collins = Pet.new({name: "Collins", type: :cat, age: 10})
    @my_day_care = DayCare.new("Caroline's Care")
    @joel = Customer.new("Joel", 2)
    @sue = Customer.new("Sue", 3)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@my_day_care).to be_a DayCare
    end

    it 'has a unique name' do
      expect(@my_day_care.name).to eq("Caroline's Care")
    end

    it 'starts out with no customers by default' do
      expect(@my_day_care.customers).to eq([])
    end
  end

  describe '#add_customer' do
    it 'can add a customer to the daycare' do
      expect(@my_day_care.customers).to eq([])

      @my_day_care.add_customer(@joel)

      expect(@my_day_care.customers).to eq([@joel])
      expect(@my_day_care.customers.count).to eq(1)
    end

    it 'can add multiple customers' do
      expect(@my_day_care.customers).to eq([])

      @my_day_care.add_customer(@joel)
      @my_day_care.add_customer(@sue)

      expect(@my_day_care.customers).to eq([@joel, @sue])
      expect(@my_day_care.customers.count).to eq(2)
    end
  end

  describe '#find_customer_by_id' do
    it 'can return a customer with a given id' do
      @my_day_care.add_customer(@joel)
      @my_day_care.add_customer(@sue)

      expect(@my_day_care.find_customer_by_id(2)).to eq(@joel)
    end
  end

  describe '#find_unfed_pets' do
    it 'can return a list of pets that are not fed' do
      @samson.feed
      @joel.adopt(@samson)
      @joel.adopt(@lucy)
      @sue.adopt(@collins)
      @my_day_care.add_customer(@joel)
      @my_day_care.add_customer(@sue)

      expect(@samson.fed?).to be true
      expect(@lucy.fed?).to be false
      expect(@collins.fed?).to be false

      expect(@my_day_care.find_unfed_pets).to be_a Array
      expect(@my_day_care.find_unfed_pets).to include(@collins, @lucy)
    end

    it 'can exclude pets that have been fed' do
      @samson.feed
      @joel.adopt(@samson)
      @joel.adopt(@lucy)
      @sue.adopt(@collins)
      @my_day_care.add_customer(@joel)
      @my_day_care.add_customer(@sue)

      expect(@samson.fed?).to be true
      expect(@lucy.fed?).to be false
      expect(@collins.fed?).to be false

      expect(@my_day_care.find_unfed_pets).to_not include(@samson)
    end
  end
end
