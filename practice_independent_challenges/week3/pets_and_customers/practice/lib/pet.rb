class Pet
  attr_reader :name, :type, :age, :fed

  def initialize(pet_details)
    @name = pet_details[:name]
    @type = pet_details[:type]
    @age = pet_details[:age]
    @fed = false
  end

  def fed?
    @fed
  end

  def feed
    @fed = true
  end
end
