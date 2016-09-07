require 'pry'
require 'csv'
require "./lib/column_definer"
require "./lib/queue"

class Loader
    attr_accessor :queue
    def initialize
      @queue = Queue.new
      @file = {}

    end

   def load_file(file_name)
     @contents = CSV.open file_name, headers: true, header_converters: :symbol
    #  contents.map { |row| ColumnDefiner.new(row)}
   end

   def attendees
     c = ColumnDefiner.new
     @file = c.clean_data(@contents)
     @file
   end

  def find(command2, command3)
    @file.select do |row, attendee|
    @queue.add_to_queue(attendee) if attendee[command2].downcase == command3.downcase
    end
    end

  def count_queue
    @queue.count_queue
  end

  def clear_queue
    @queue.clear_queue
  end

  def print_queue
    @queue.print_queue
  end

  def queue_print_by(input)
    @queue.queue_print_by(input)
  end
end

    # l = Loader.new
    # l.load_file("event_attendees.csv")
    # l.attendees
    # l.find("first_name", "sarah")
    # puts l.count_queue
  #  l.queue_print_by("last_name")
