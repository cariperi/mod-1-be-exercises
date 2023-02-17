require 'spec_helper'

describe Boat do
  before(:each) do
    @kayak = Boat.new(:kayak, 20)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@kayak).to be_a Boat
    end

    it 'has a type' do
      expect(@kayak.type).to eq(:kayak)
    end

    it 'has a price per hour' do
      expect(@kayak.price_per_hour).to eq(20)
    end

    it 'starts with no hours rented by default' do
      expect(@kayak.hours_rented).to eq(0)
    end
  end

  describe '#add_hour' do
    it 'can add multiple hours to the total hours rented' do
      expect(@kayak.hours_rented).to eq(0)
      @kayak.add_hour
      @kayak.add_hour
      @kayak.add_hour
      expect(@kayak.hours_rented).to_eq(3)
    end
  end
end