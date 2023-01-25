class Wizard
    attr_accessor :name, :bearded, :rested, :spell_count

    def initialize(name, bearded: true, rested: true, spell_count: 0)
        @name = name
        @bearded = bearded
        @rested = rested
        @spell_count = spell_count
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
