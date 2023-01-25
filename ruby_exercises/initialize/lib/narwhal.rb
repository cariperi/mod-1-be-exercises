class Narwhal
    attr_reader :name, :weight, :cute

    def initialize(hash)
        @name = hash[:name]
        @weight = hash[:weight]
        @cute = hash[:cute]
    end

    def cute?
        @cute
    end
end