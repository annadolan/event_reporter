require 'pry'
require 'csv'
require "./lib/data_cleaner"
require "./lib/queue"

class Manager
  attr_accessor :queue
  def initialize
    @queue = Queue.new
    @file = {}
  end

  def load_file(file_name)
    @contents = CSV.open file_name, headers: true, header_converters: :symbol
  end

  def attendees
    data_cleaner = DataCleaner.new
    @file = data_cleaner.clean_data(@contents)
  end

  def find(user_input_2, user_input_3)
    @queue.clear_queue
    @file.select do |row, attendee|
    @queue.add_to_queue(attendee) if attendee[user_input_2].downcase == user_input_3
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
