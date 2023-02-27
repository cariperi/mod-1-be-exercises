require './lib/attendee'
require './lib/event_manager'

file = 'data/event_attendees.csv'
event_manager = EventManager.new(file)

event_manager.create_attendees

event_manager.display_attendees
