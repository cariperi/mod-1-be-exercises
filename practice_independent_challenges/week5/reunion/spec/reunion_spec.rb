require 'spec_helper'

describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Frisbee")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@reunion).to be_a Reunion
    end

    it 'has a name' do
      expect(@reunion.name).to eq("1406 BE")
    end

    it 'has activities that starts as empty by default' do
      expect(@reunion.activities).to eq([])
    end
  end

  describe '#add_activity' do
    it 'can add an activity object to the reunions activities' do
      expect(@reunion.activities).to eq([])

      @reunion.add_activity(@activity_1)

      expect(@reunion.activities).to eq([@activity_1])
      expect(@reunion.activities[0]).to be_a Activity
    end
  end

  describe '#total_cost' do
    it 'can return the total cost of the reunion event' do
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant("Bob", 50)
      @activity_2.add_participant("Nancy", 30)

      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)

      expect(@reunion.total_cost).to be_a Integer
      expect(@reunion.total_cost).to eq(140)
    end
  end

  describe '#settle_up' do
    it 'can return a hash with participants and what they owe in total' do
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant("Bob", 40)
      @activity_2.add_participant("Nancy", 30)
      @activity_2.add_participant("Maria", 20)

      expect(@reunion.settle_up).to be_a Hash
      expect(@reunion.settle_up.keys.count).to eq(4)
      expect(@reunion.settle_up.keys).to eq(["Maria", "Luther", "Bob", "Nancy"])
      expect(@reunion.settle_up.values).to eq([20, -10, 10, 0])
    end
  end
end
