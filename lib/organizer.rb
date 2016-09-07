require 'pry'
#require "csv"
#require "sunlight/congress"
require "./lib/loader"
require "./lib/output"
require "./lib/queue"

class Organizer
 attr_reader :file
 def initialize
   @file = nil
   @l = Loader.new
 end

puts "Enter command."

def get_command

  input = gets.chomp
  input = input.downcase.gsub(/to | by /, " ").split(" ")

  @command = input[0]
  @command2 = input[1]
  @command3 = input[2]
  do_command
end

def do_command


  if @command == "load"
    if @command2.nil?
      file_name = "event_attendees.csv"
    else file_name = @command2
    end
    @l.load_file(file_name)
    @file = @l.attendees
  elsif @command == "queue" && @command2 == "count"
    puts @l.count_queue
  elsif @command == "queue" && @command2 == "clear"
    @l.clear_queue
  elsif @command == "queue" && @command2 == "print"
    if @command3.nil?
      @l.print_queue
    else
      @l.queue_print_by(@command3)
    end
  elsif @command == "help"
    o = Output.new
    o.run_help(@command2, @command3)
  elsif @command == "find"
    @l.clear_queue
    @l.find(@command2, @command3)
  elsif @command == "exit"
     return nil
   else puts "Not a valid command"
  end
  get_command
end



def find(input)

end



# def run_queue
#   case command2
#   when "count" then puts queue.length
#   when "clear" then queue = []
#   when "district"
#       if queue.length <= 10
#         queue_district
#       end
#   when "print" then queue_print
#   when "save" then queue_save
#   when "export" then queue_export
#   end



# end





end

o = Organizer.new
o.get_command
