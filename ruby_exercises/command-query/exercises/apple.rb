class Apple

    def initialize
        @ripe = false
        @weeks = 0
    end

    def wait_a_week
        @weeks +=1
        ripen if @weeks >= 3
    end

    def ripen
        @ripe = true
    end

    def ripe?
        @ripe
    end
end
