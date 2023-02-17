require 'spec_helper'

describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@dock).to be_a Dock
    end

    it 'has a name' do
      expect(@dock.name).to eq('The Rowing Dock')
    end

    it 'has a max rental time' do
      expect(@dock.max_rental_time).to eq(3)
    end
  end
end
