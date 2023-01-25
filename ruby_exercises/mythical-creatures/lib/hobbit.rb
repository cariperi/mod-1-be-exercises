class Hobbit
    attr_accessor :name, :disposition, :age

    def initialize(name, disposition='homebody', age=0)
        @name = name
        @disposition = disposition
        @age = age
    end

    def celebrate_birthday
        @age +=1
    end

    def adult?
        @age >= 33
    end

    def old?
        @age >= 101
    end

    def has_ring?
        @name.downcase == 'frodo'
    end

    def is_short?
        true
    end
end
