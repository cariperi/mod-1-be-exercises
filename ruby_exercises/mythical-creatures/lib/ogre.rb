class Ogre
    attr_reader :name, :home
    attr_accessor :swings
    
    def initialize(name, home='Swamp')
        @name = name
        @home = home
        @swings = 0
    end

    def encounter(person)
        person.encounter_counter +=1
        swing_at(person) if person.notices_ogre?
    end

    def swing_at(person)
        @swings +=1
        person.knocked_out = true if @swings % 2 == 0
    end

    def apologize(person)
        person.knocked_out = false
    end
end

class Human
    attr_reader :name
    attr_accessor :encounter_counter, :knocked_out

    def initialize(name='Jane')
        @name = name
        @encounter_counter = 0
        @knocked_out = false
    end

    def notices_ogre?
        @encounter_counter % 3 == 0
    end

    def knocked_out?
        @knocked_out
    end
end