class Venue
  attr_reader :name, :capacity, :patrons

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @patrons = []
  end

  def add_patron(name)
    @patrons << name
  end

  def yell_at_patrons
    @patrons.map { |patron| patron.upcase }
  end

  def over_capacity?
    @patrons.count > @capacity
  end

  def kick_out
    @patrons.pop
  end
end
