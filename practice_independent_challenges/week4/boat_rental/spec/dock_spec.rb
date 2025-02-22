require 'spec_helper'

describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)
  end

  describe '#initialize' do
  it 'exists' do
    expect(@dock).to be_a Dock
    expect(@dock.rental_log).to eq({})
  end

  it 'has a name' do
    expect(@dock.name).to eq('The Rowing Dock')
  end

  it 'has a max rental time' do
    expect(@dock.max_rental_time).to eq(3)
  end
end

  describe '#rent' do
    before(:each) do
      @kayak_1 = Boat.new(:kayak, 20)
      @kayak_2 = Boat.new(:kayak, 20)
      @sup_1 = Boat.new(:standup_paddle_board, 15)
      @patrick = Renter.new("Patrick Star", "4242424242424242")
      @eugene = Renter.new("Eugene Crabs", "1313131313131313")
    end

    it 'can allow a renter to rent a specific boat' do
      expect(@dock.rental_log).to eq({})

      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)

      expect(@dock.rental_log).to be_a Hash
      expect(@dock.rental_log.keys).to eq([@kayak_1, @kayak_2, @sup_1 ])
      expect(@dock.rental_log.values).to include(@patrick, @eugene)
      expect(@dock.rental_log[@kayak_1]).to eq(@patrick)
      expect(@dock.rental_log[@kayak_2]).to eq(@patrick)
      expect(@dock.rental_log[@sup_1]).to eq(@eugene)
    end
  end

  describe '#charge' do
    before(:each) do
      @kayak_1 = Boat.new(:kayak, 20)
      @kayak_2 = Boat.new(:kayak, 20)
      @sup_1 = Boat.new(:standup_paddle_board, 15)
      @patrick = Renter.new("Patrick Star", "4242424242424242")
      @eugene = Renter.new("Eugene Crabs", "1313131313131313")
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
    end

    it 'can display the charge amount and card number of the renter as a hash' do
      @kayak_1.add_hour
      @kayak_1.add_hour

      expect(@dock.charge(@kayak_1)).to be_a Hash
      expect(@dock.charge(@kayak_1)).to eq({:card_number => "4242424242424242", :amount => 40})
    end

    it 'does not add charges for hours past the dock max rental time' do
      @sup_1.add_hour
      @sup_1.add_hour
      @sup_1.add_hour

      expect(@dock.charge(@sup_1)).to be_a Hash
      expect(@dock.charge(@sup_1)).to eq({:card_number => "1313131313131313", :amount => 45})
      @sup_1.add_hour
      @sup_1.add_hour
      expect(@dock.charge(@sup_1)).to eq({:card_number => "1313131313131313", :amount => 45})
    end
  end

  describe '#get_hours' do
    before(:each) do
      @kayak_1 = Boat.new(:kayak, 20)
      @kayak_2 = Boat.new(:kayak, 20)
      @sup_1 = Boat.new(:standup_paddle_board, 15)
      @patrick = Renter.new("Patrick Star", "4242424242424242")
      @eugene = Renter.new("Eugene Crabs", "1313131313131313")
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
      5.times{@sup_1.add_hour}
      2.times{@kayak_1.add_hour}
    end

    it 'can return the hours a boat is rented' do
      expect(@dock.get_hours(@kayak_1)).to eq(2)
    end

    it 'does not return hours beyond the dock max rental time' do
      expect(@dock.get_hours(@sup_1)).to eq(3)
    end
  end

  describe '#log_hour' do
    before(:each) do
      @kayak_1 = Boat.new(:kayak, 20)
      @kayak_2 = Boat.new(:kayak, 20)
      @canoe = Boat.new(:canoe, 25)
      @sup_1 = Boat.new(:standup_paddle_board, 15)
      @sup_2 = Boat.new(:standup_paddle_board, 15)
      @patrick = Renter.new("Patrick Star", "4242424242424242")
      @eugene = Renter.new("Eugene Crabs", "1313131313131313")
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
    end

    it 'adds an additional rental hour to all boats currently rented' do
      expect(@dock.rental_log.keys).to include(@kayak_1, @kayak_2)
      expect(@kayak_1.hours_rented).to eq(0)
      expect(@kayak_2.hours_rented).to eq(0)

      @dock.log_hour

      expect(@kayak_1.hours_rented).to eq(1)
      expect(@kayak_2.hours_rented).to eq(1)
    end
  end

  describe '#return' do
    before(:each) do
      @kayak_1 = Boat.new(:kayak, 20)
      @kayak_2 = Boat.new(:kayak, 20)
      @canoe = Boat.new(:canoe, 25)
      @sup_1 = Boat.new(:standup_paddle_board, 15)
      @sup_2 = Boat.new(:standup_paddle_board, 15)
      @patrick = Renter.new("Patrick Star", "4242424242424242")
      @eugene = Renter.new("Eugene Crabs", "1313131313131313")

      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.log_hour
      @dock.rent(@canoe, @patrick)
      @dock.log_hour
    end

    it 'can return a boat' do
      expect(@dock.rental_log.keys).to include(@kayak_1, @kayak_2, @canoe)

      @dock.return(@kayak_1)

      expect(@dock.rental_log.keys).to include(@kayak_2, @canoe)
      expect(@dock.rental_log.keys).to_not include(@kayak_1)
    end
  end

  describe '#revenue' do
    before(:each) do
      @kayak_1 = Boat.new(:kayak, 20)
      @kayak_2 = Boat.new(:kayak, 20)
      @canoe = Boat.new(:canoe, 25)
      @sup_1 = Boat.new(:standup_paddle_board, 15)
      @sup_2 = Boat.new(:standup_paddle_board, 15)
      @patrick = Renter.new("Patrick Star", "4242424242424242")
      @eugene = Renter.new("Eugene Crabs", "1313131313131313")

      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.log_hour
      @dock.rent(@canoe, @patrick)
      @dock.log_hour
    end

    it 'does not generate any revenue until boats are returned' do
      expect(@dock.revenue).to eq(0)
    end

    it 'calculates revenue for boats that are returned' do
      @dock.return(@kayak_1)
      @dock.return(@kayak_2)
      @dock.return(@canoe)

      expect(@dock.revenue).to eq(105)

      @dock.rent(@sup_1, @eugene)
      @dock.rent(@sup_2, @eugene)
      @dock.log_hour
      @dock.log_hour
      @dock.log_hour
      @dock.log_hour
      @dock.log_hour

      @dock.return(@sup_1)
      @dock.return(@sup_2)

      expect(@dock.revenue).to eq(195)
    end
  end
end
