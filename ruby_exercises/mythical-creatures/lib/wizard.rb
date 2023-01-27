class Wizard
    attr_reader :name

    def initialize(name, bearded: true)
        @name = name
        @bearded = bearded
        @rested = true
        @spell_count = 0
    end

    def bearded?
        @bearded
    end

    def rested?
        @rested
    end

    def incantation(words)
        "sudo #{words}"
    end

    def cast
        @spell_count +=1
        @rested = false if @spell_count >= 3
        'Magic Missile!'
    end
end
