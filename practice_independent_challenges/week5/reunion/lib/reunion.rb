class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum(&:total_cost)
  end

  def settle_up
    settle_up = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |name, amount|
        settle_up[name] += amount
      end
    end
    settle_up
  end
end