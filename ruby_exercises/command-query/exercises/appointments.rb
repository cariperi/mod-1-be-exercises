class Appointments
    def initialize
        @open_slots = []
    end

    def at(time)
        @open_slots << time
    end

    def earliest
        @open_slots.min
    end
end