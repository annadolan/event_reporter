#require "sunlight"
require "pry"


#Sunlight::Base.api_key = "8f5000aeb75c4925b7562198b8c60d3a"

class Queue
  attr_accessor :queue
  def initialize
    # @queue = {}
    @queue = []
  end

  def add_to_queue(attendee)
    # member = {}
    # member[row] = attendee
    # @queue.merge!(member)
    @queue << attendee
  end

  def count_queue
    @queue.count
  end

  def clear_queue
    @queue = []
  end


  def print_queue#(input)
    i = 0
    printf "%-10s %-15s %-45s %-15s %-40s %-25s %-10s %s\n", "FIRST NAME", "LAST NAME", "EMAIL", "HOME PHONE", "STREET", "CITY", "STATE", "ZIP CODE"
    @queue.each do |elem|
      printf "%-10s %-15s %-45s %-15s %-40s %-25s %-10s %s\n", @queue[i]["first_name"], @queue[i]["last_name"], @queue[i]["email"], @queue[i]["home_phone"],
              @queue[i]["street"], @queue[i]["city"], @queue[i]["state"], @queue[i]["zipcode"]
        i += 1
      end
  end


  # def district_by_zipcode(zipcode)
  #   Sunlight::District.by_zipcode(zipcode)
  # end
  #
  # def queue_district
  #   if @queue.count <= 10
  #     zipcodes = []
  #     districts = []
  #     i = 0
  #     @queue.each do |item|
  #       zipcodes << @queue[i]["zipcode"]
  #     end
  #     zipcodes.each do |zip|
  #       districts << district_by_zipcode(zip)
  #     end
  #     districts
  #
  #   else
  #     puts "Too many items in queue"
  #   end
  #
  # end


  def queue_print_by(attribute)
    i = 0
    printf "%-10s %-15s %-45s %-15s %-40s %-25s %-10s %s\n", "FIRST NAME", "LAST NAME", "EMAIL", "HOME PHONE", "STREET", "CITY", "STATE", "ZIP CODE"
    sorted = @queue.sort_by do |item|
      item[attribute]
    end
    sorted.each do |elem|
      printf "%-10s %-15s %-45s %-15s %-40s %-25s %-10s %s\n", sorted[i]["first_name"], sorted[i]["last_name"], sorted[i]["email"], @queue[i]["home_phone"],
              sorted[i]["street"], sorted[i]["city"], sorted[i]["state"], sorted[i]["zipcode"]
        i += 1
      end

  end

  def queue_save_to(file_name)
  end

  def queue_export_html(file_name)
  end

end
#  q = Queue.new
#  q.add_to_queue({"first_name"=>"Sarah",
#             "last_name"=>"Riordan",
#             "email"=>"ctuhspugha@jumpstartlab.com",
#             "home_phone"=>"7202058000",
#             "street"=>"2814 Tennyson St.",
#             "city"=>"Denver",
#             "state"=>"CO",
#             "zipcode"=>"80212"})
# q.add_to_queue({"first_name"=>"Sarah",
#             "last_name"=>"Hough",
#             "email"=>"gi@jumpstartlab.com",
#             "home_phone"=>"2036506000",
#             "street"=>"42c Powder Mill Drive",
#             "city"=>"Stratford",
#             "state"=>"CT",
#             "zipcode"=>"06614"})
#  # puts q.count_queue
#  # q.print_queue
# q.queue_print_by("last_name")
# q.queue_print_by("zipcode")
# q.queue_print_by("state")
