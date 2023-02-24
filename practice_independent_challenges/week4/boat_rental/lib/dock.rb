class Dock
  attr_reader :name,
              :max_rental_time,
              :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    charges = {}
    charges[:card_number] = @rental_log[boat].credit_card_number
    charges[:amount] = (get_hours(boat) * boat.price_per_hour)
    charges
  end

  def get_hours(boat)
    if boat.hours_rented > @max_rental_time
      hours = @max_rental_time
    else
      hours = boat.hours_rented
    end
    hours
  end

  def log_hour
    @rental_log.each do |boat, renter|
      boat.hours_rented += 1
    end
  end
end
