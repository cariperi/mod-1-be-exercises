class Centaur
    attr_reader :name, :breed
    attr_accessor :cranky, :position, :sick

    def initialize(name, breed='Not specified.')
        @name = name
        @breed = breed
        @cranky = false
        @position = :standing_up
        @sick = false
        @run_count = 0
        @shoot_count = 0
    end

    def shoot
        if cranky? || laying?
            'NO!'
        else
            @shoot_count +=1
            @cranky = true if @shoot_count + @run_count >= 3
            'Twang!!!'
        end
    end

    def run
        if laying?
            'NO!'
        else 
        @run_count +=1
        @cranky = true if @shoot_count + @run_count >= 3
        'Clop clop clop clop!'
        end
    end

    def sleep
        standing? ? 'NO!' : @cranky = false
    end

    def lay_down
        @position = :laying_down
    end

    def stand_up
        @position = :standing_up
    end

    def drink_potion
        if standing? && cranky?
            @cranky = false
            'Gulp!'
        elsif standing? && !cranky?
            @sick = true
            'Gulp!'
        else
            'NO!'
        end
    end

    def cranky?
        @cranky
    end

    def sick?
        @sick
    end

    def standing?
        @position == :standing_up
    end

    def laying?
        @position == :laying_down
    end
end
