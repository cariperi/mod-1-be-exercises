class Parrot
    attr_reader :name, :sound, :known_words

    def initialize(hash)
        @name = hash[:name]
        @sound = 'Squawk!'
        @known_words = hash[:known_words]
    end
end
