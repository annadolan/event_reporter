require "./lib/looper"

class EventReporter
  looper = Looper.new
  puts "Enter command."
  looper.get_command
end
