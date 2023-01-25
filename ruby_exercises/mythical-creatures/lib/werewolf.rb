class Werewolf
    attr_reader :name, :location
    attr_accessor :victims

    def initialize(name, location="Not given.", victims: [])
        @name = name
        @location = location
        @human = true
        @wolf = false
        @hungry = false
        @victims = victims
    end

    def human?
        @human
    end

    def wolf?
        @wolf
    end

    def hungry?
        @hungry
    end

    def change!
        @human = !@human
        @wolf = !@wolf
        @hungry = true if @wolf
    end

    def consume(human)
       @human ? "Cannot consume a victim." : @victims << human
       @hungry = false
       human.status = :dead
    end
end
