class Bag
  attr_reader :candies

  def initialize
    @candies = []
  end

  def empty?
    @candies == []
  end

  def count
    @candies.count
  end

  def add_candy(candy)
    @candies << candy
  end

  def contains?(candy)
    @candies.map{|candy| candy.type}.include?(candy)
  end
end
