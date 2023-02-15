class DayCare
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def find_customer_by_id(id)
    @customers.find {|customer| customer.id == id}
  end

  def find_unfed_pets
    pets = @customers.map {|customer| customer.pets}.flatten
    pets.find_all {|pet| pet.fed? == false}
  end
end
