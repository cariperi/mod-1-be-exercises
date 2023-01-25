class Lion
    attr_accessor :name, :sound

    def initialize(hash)
        @name = hash[:name]
        @sound = hash[:sound]
    end
end
