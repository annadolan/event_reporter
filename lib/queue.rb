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
    if @queue == []
      puts "Queue is empty."
    elsif @queue[0].length <= 8
      i = 0
      printf "%-15s %-15s %-45s %-15s %-25s %-10s %-45s %s\n", "LAST NAME", "FIRST NAME", "EMAIL", "ZIP CODE", "CITY", "STATE", "STREET", "HOME PHONE"
      @queue.each do |elem|
        printf "%-15s %-15s %-45s %-15s %-25s %-10s %-45s %s\n", @queue[i]["last_name"], @queue[i]["first_name"], @queue[i]["email_address"], @queue[i]["zipcode"], @queue[i]["city"], @queue[i]["state"], @queue[i]["street"], @queue[i]["homephone"]
        i += 1
      end
    else
      i = 0
      printf "%-15s %-15s %-45s %-15s %-25s %-10s %-45s %10s %s\n", "LAST NAME", "FIRST NAME", "EMAIL", "ZIP CODE", "CITY", "STATE", "STREET", "HOME PHONE", "DISTRICT"
      @queue.each do |elem|
        printf "%-15s %-15s %-45s %-15s %-25s %-10s %-45s %10s %s\n", @queue[i]["last_name"], @queue[i]["first_name"], @queue[i]["email_address"], @queue[i]["zipcode"], @queue[i]["city"], @queue[i]["state"], @queue[i]["street"], @queue[i]["homephone"], @queue[i]["district"]
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
    if data["results"][0].nil?
      district = "n/a"
    else district = data["results"][0]["district"]
    end
    district
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
    else
      puts "District data can only be added when there are fewer than ten items in the queue."
    end
  end

  def queue_save_to(file_name)
    Dir.mkdir("output") unless Dir.exists? "output"
    CSV.open("output/#{file_name}",'wb') do |csv|
      if @queue != []
        csv << @queue.first.keys
        @queue.each do |hash|
          csv << hash.values
        end
      elsif @queue == []
        csv << ["last_name", "first_name", "email_address", "zipcode", "city", "state", "street", "homephone", "district"]
      end
    end
  end

  def queue_export_html(filename)
    Dir.mkdir("output") unless Dir.exists? "output"
    template = File.read "html_format.erb"
    erb_template = ERB.new template
    export_report = erb_template.result(binding)
    File.open("./output/#{filename}",'w') do |file|
      file.puts export_report
    end
  end
end
