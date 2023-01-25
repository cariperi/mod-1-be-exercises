class Medusa
attr_reader :name
attr_accessor :statues

    def initialize(name, statues: [])
        @name = name
        @statues = statues
    end

    def stare(person)
        if statues.length < 3
            statues.unshift(person)
            person.petrify
        else
            statues.pop.unpetrify
            stare(person)
        end
    end
end

class Person
attr_reader :name
attr_accessor :is_stoned

    def initialize(name, is_stoned=false)
        @name = name
        @is_stoned = is_stoned
    end

    def stoned?
        @is_stoned
    end

    def petrify
        @is_stoned = true
    end

    def unpetrify
        @is_stoned = false
    end
end
