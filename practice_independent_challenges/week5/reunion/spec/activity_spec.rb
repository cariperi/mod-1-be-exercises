require 'spec_helper'

describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@activity).to be_a Activity
    end

    it 'has attributes' do
      expect(@activity.name).to eq("Brunch")
      expect(@activity.participants).to eq({})
    end
  end
end
