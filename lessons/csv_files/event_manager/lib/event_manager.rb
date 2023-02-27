require 'csv'

class EventManager
  attr_reader :contents,
              :attendees

  def initialize(file_name)
    @contents = open_file(file_name)
    @attendees = []
  end

  def open_file(file_name)
    CSV.open file_name, headers: true, header_converters: :symbol
  end

  def create_attendees
    @contents.map do |row|
      @attendees << Attendee.new(row[:id], row[:first_name], row[:last_name], row[:zipcode])
    end
  end

  def display_attendees
    @attendees.each do |attendee|
      puts attendee.display
    end
  end
end
