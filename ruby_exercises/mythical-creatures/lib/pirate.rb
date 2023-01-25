class Pirate
    attr_accessor :name, :job, :strikes, :booty

    def initialize(name, job='Scallywag', strikes=0, booty=0)
        @name = name
        @job = job
        @strikes = strikes
        @booty = booty
    end

    def commit_heinous_act
        @strikes +=1
    end

    def rob_ship
        @booty +=100
    end

    def cursed?
        @strikes >=3
    end
end
