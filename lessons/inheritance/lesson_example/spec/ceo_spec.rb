require './lib/ceo'

RSpec.describe Ceo do

  describe "setup" do
    it "exists" do
      ceo = Ceo.new(15,20, "Bob", 1999)
    end
    it "has base_salary and bonus attributes" do
      ceo = Ceo.new(15,20, "Bob", 1999)

      expect(ceo.base_salary).to eq(15)
      expect(ceo.bonus).to eq(20)
    end
  end

  describe "Has a name, ID, and total_compensation" do
    # Write tests to prove that a Ceo instance can have a Name and ID number, like any other Employee.
    it 'has a name and an id' do
      ceo = Ceo.new(15,20, "Bob", 1999)
      expect(ceo).to be_a(Ceo)
      expect(ceo.is_a?Employee).to be true
      expect(ceo.name).to eq("Bob")
      expect(ceo.id).to eq(1999)
    end
    # Also, the CEO should be able to receive a total compensation. Write at least one test that proves they can access this method.
    it 'has a total compensation' do
      ceo = Ceo.new(15,20, "Bob", 1999)
      expect(ceo.total_compensation).to eq(35)
    end
  end

end