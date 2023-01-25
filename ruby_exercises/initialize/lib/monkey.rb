class Monkey
    attr_accessor :name, :type, :favorite_food

    def initialize(array)
        @name = array[0]
        @type = array[1]
        @favorite_food = array[2]
    end
end
