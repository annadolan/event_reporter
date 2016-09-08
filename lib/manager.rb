require 'pry'
require 'csv'
require "./lib/column_definer"
require "./lib/queue"

class Manager
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

  def find(user_input_2, user_input_3)
    @queue.clear_queue
    @file.select do |row, attendee|
    @queue.add_to_queue(attendee) if attendee[user_input_2].downcase == user_input_3.downcase
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

  def queue_save_to(input)
    @queue.queue_save_to(input)
  end

  def queue_district
    @queue.queue_district
  end

  def queue_export(input)
    @queue.queue_export_html(input)
  end
end

    #  l = Loader.new
    #  l.load_file("event_attendees.csv")
    #  l.attendees
    # l.find("first_name", "sarah")
    # puts l.count_queue
  #  l.queue_print_by("last_name")
