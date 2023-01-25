class Dragon
    attr_accessor :name, :color, :rider, :hungry, :food

    def initialize(name, color, rider, hungry=true, food=0)
        @name = name
        @color = color
        @rider = rider
        @hungry = hungry
        @food = food
    end

    def hungry?
        @hungry == true
    end

    def eat
        @food +=1
        @hungry = false if @food > 2
    end
end
