require 'spec_helper'

describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
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
end
