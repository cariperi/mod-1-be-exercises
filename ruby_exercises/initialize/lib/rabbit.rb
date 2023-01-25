class Rabbit
    attr_reader :name

    def initialize(hash)
        hash[:num_syllables] == 2 ? @name = "#{hash[:name]} Rabbit" : @name = hash[:name]
    end
end
