class Unicorn
attr_accessor :name, :color

    def initialize(name, color="silver")
        @name = name
        @color = color
    end

    def silver?
        @color == "silver"
    end

    def say(words)
       "**;* #{words} **;*"
    end
end
