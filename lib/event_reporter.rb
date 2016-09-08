require "./lib/organizer"

class EventReporter
    o = Organizer.new
    puts "Enter command."
    o.get_command
end
