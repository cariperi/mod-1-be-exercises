require "./lib/manager"

RSpec.describe Manager do
  describe "setup" do
    it "exists" do
      manager = Manager.new(12, "May", 1989)
      expect(manager).to be_a Manager
    end

    it "has base_salary, per_team_rate, and departments attributes" do
      manager = Manager.new(12, "May", 1989)
      expect(manager.base_salary).to eq(12)
      expect(manager.per_team_rate).to eq 5
      expect(manager.departments).to be_instance_of Array
      expect(manager.departments.length).to eq (0)
    end

    it "can add_department" do
      manager = Manager.new(12, "May", 1989)
      manager.add_department("Sales")
      expect(manager.departments).to eq(["Sales"])
      expect(manager.departments.length).to eq(1)
    end

    it "has benefits to start with" do
      manager = Manager.new(12, "May", 1989)
      expect(manager.benefits).to eq([:sick_leave, :health_insurance])
    end
  end

  describe "Ability to have name and ID, like any other Employee" do
    it 'has a name and an id' do
      manager = Manager.new(12, "May", 1989)
      expect(manager).to be_a(Employee)
      expect(manager.name).to eq("May")
      expect(manager.id).to eq(1989)
    end

    it 'can have a total compensation' do
      manager = Manager.new(12, "May", 1989)
      expect(manager.total_compensation).to eq(72)
    end
  end
end