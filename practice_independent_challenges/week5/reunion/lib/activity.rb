class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, amount)
    @participants[name] = amount
  end

  def total_cost
    return 0 if @participants.empty?
    @participants.values.sum
  end

  def split
    return 0 if @participants.empty?
    (total_cost) / (@participants.keys.count)
  end
end
