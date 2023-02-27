# ./lib/event_manager.rb
require "csv"
puts "EventManager initialized."

# contents = File.read 'data/event_attendees.csv'
# puts contents

# lines = File.readlines 'data/event_attendees.csv'
# row_index = 0
# lines.each_with_index do |line, index|
#   next if index == 0
#   columns = line.split(',')
#   name = columns[2]
#   puts name
# end


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
  # if zipcode.nil?
  #   zipcode = '00000'
  # elsif zipcode.length < 5
  #   zipcode = zipcode.rjust 5, '0'
  # elsif zipcode.length > 5
  #   zipcode = zipcode[0..4]
  # else
  #   zipcode
  # end
end

contents = CSV.open 'data/event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  puts "#{name} #{zipcode}"
end