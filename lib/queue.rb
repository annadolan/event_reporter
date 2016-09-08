require "pry"
require 'csv'
require 'json'
require 'open-uri'
require 'erb'

class Queue
  attr_accessor :queue
  def initialize
    @queue = []
  end

  def add_to_queue(attendee)
    @queue << attendee
  end

  def count_queue
    @queue.count
  end

  def clear_queue
    @queue = []
  end


  def print_queue
    if @queue[0].length <= 8
      i = 0
      printf "%-10s %-15s %-45s %-15s %-40s %-25s %-10s %s\n", "FIRST NAME", "LAST NAME", "EMAIL", "HOME PHONE", "STREET", "CITY", "STATE", "ZIP CODE"
      @queue.each do |elem|
        printf "%-10s %-15s %-45s %-15s %-40s %-25s %-10s %s\n", @queue[i]["first_name"], @queue[i]["last_name"], @queue[i]["email"], @queue[i]["home_phone"],
                @queue[i]["street"], @queue[i]["city"], @queue[i]["state"], @queue[i]["zipcode"]
        i += 1
    end
    else
      i = 0
      printf "%-10s %-15s %-45s %-15s %-40s %-25s %-10s %-10s %s\n", "FIRST NAME", "LAST NAME", "EMAIL", "HOME PHONE", "STREET", "CITY", "STATE", "ZIP CODE", "DISTRICT"
      @queue.each do |elem|
        printf "%-10s %-15s %-45s %-15s %-40s %-25s %-10s %-10s %s\n", @queue[i]["first_name"], @queue[i]["last_name"], @queue[i]["email"], @queue[i]["home_phone"],
                @queue[i]["street"], @queue[i]["city"], @queue[i]["state"], @queue[i]["zipcode"], @queue[i]["district"]
        i += 1
        end
    end
  end

  def queue_print_by(attribute)
    sorted = @queue.sort_by do |item|
           item[attribute]
         end
    @queue = sorted
    print_queue
   end


  def district_by_zipcode(zipcode)
    url = "http://congress.api.sunlightfoundation.com/districts/locate?zip=#{zipcode}&apikey=8f5000aeb75c4925b7562198b8c60d3a"
    data = JSON.parse(open(url).read)
    data["results"][0]["district"]
  end

  def queue_district
    i = 0
    if @queue.count <= 10
       @queue.each do |attendee|
         zipcode = @queue[i]["zipcode"]
         district_no = district_by_zipcode(zipcode)
         @queue[i].merge!("district" => district_no.to_s)
         i += 1
       end
       @queue
    else puts "Too many items in queue."
    end
  end

  def queue_save_to(file_name)
  CSV.open("./output/#{file_name}.csv", "wb") do |csv|
  csv << @queue.first.keys
  @queue.each do |hash|
    csv << hash.values
  end
end
  end

  def queue_export_html(filename)
    template = File.read "html_format.erb"
    erb_template = ERB.new template
    export_report = erb_template.result(binding)
    File.open("./output/#{filename}.html",'w') do |file|
      file.puts export_report
    end
  end

end
 #   q = Queue.new
 #   q.add_to_queue({"first_name"=>"Sarah",
 #            "last_name"=>"Riordan",
 #            "email"=>"ctuhspugha@jumpstartlab.com",
 #            "home_phone"=>"7202058000",
 #            "street"=>"2814 Tennyson St.",
 #            "city"=>"Denver",
 #            "state"=>"CO",
 #            "zipcode"=>"80212"})
 # q.add_to_queue({"first_name"=>"Sarah",
 #            "last_name"=>"Hough",
 #            "email"=>"gi@jumpstartlab.com",
 #            "home_phone"=>"2036506000",
 #            "street"=>"42c Powder Mill Drive",
 #            "city"=>"Stratford",
 #            "state"=>"CT",
 #            "zipcode"=>"06614"})
#  puts q.count_queue
# q.print_queue
# q.queue_save_to("new_queue")
# q.queue_print_by("last_name")
# q.queue_print_by("zipcode")
# q.queue_print_by("state")
#q.district_by_zipcode("80210")
# q.queue_district
