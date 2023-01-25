class Direwolf
    attr_reader :name, :home, :size
    attr_accessor :starks_to_protect

    def initialize(name, home='Beyond the Wall', size='Massive')
        @name = name
        @home = home
        @size = size
        @starks_to_protect = []
    end

    def protects(person)
        if @home == person.location && @starks_to_protect.count < 2
            @starks_to_protect.unshift(person) 
            person.safe = true
        end
    end

    def leaves(person)
        person.safe = false
        @starks_to_protect.delete(person)
        person
    end

    def hunts_white_walkers?
        @starks_to_protect.count == 0
    end
end

class Stark
    attr_reader :name, :location
    attr_accessor :safe

    def initialize(name, location='Winterfell')
        @name = name
        @location = location
        @safe = false
    end

    def safe?
        @safe
    end

    def house_words
        'Winter is Coming'
    end
end
