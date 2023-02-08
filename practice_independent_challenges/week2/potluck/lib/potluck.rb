class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
    @dishes
  end

  def get_all_from_category(category)
    @dishes.find_all do |dish|
      dish.category == category
    end
  end

  def menu
    menu_hash = {}
    menu_hash[:appetizers] = get_all_from_category(:appetizer).map {|dish| dish.name}.sort
    menu_hash[:entres] = get_all_from_category(:entre).map {|dish| dish.name}.sort
    menu_hash[:desserts] = get_all_from_category(:dessert).map {|dish| dish.name}.sort
    menu_hash
  end

  def ratio(category)
    (get_all_from_category(category).count).fdiv(@dishes.count) * 100
  end
end
