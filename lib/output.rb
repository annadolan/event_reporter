class Output
  def run_help(input, input2 = nil)
    if input.nil?
      output = "Available commands: load, queue, find"
    elsif input == "queue"
      if input2 == "count"
        output = "Counts items in queue"
      elsif input2 == "clear"
        output = "Clears queue"
      elsif input2 == "district"
        output = "Uses Sunlight API to get Congressional District"
      elsif input2 == "print"
        output = "Prints items in queue, by attribute or criteria if specified"
      elsif input2 == "save"
        output = "Saves items to a CSV file with given file name"
      elsif input2 == "export"
        output = "Exports current queue to an HTML file"
      end
    elsif input == "find"
      output = "Use the find command to find items with a specific attribute."
    elsif input == "load"
      output = "Erases any loaded data and parses specified file"
    end
    puts output
    output
  end

  # def print_queue(input)
  #   i = 0
  #   printf "%-15s %-15s %-35s %-15s %-25s %-15s %-10s %s\n", "FIRST NAME", "LAST NAME", "EMAIL", "HOME PHONE", "STREET", "CITY", "STATE", "ZIP CODE"
  #   input.each do |elem|
  #       printf "%-15s %-15s %-35s %-15s %-25s %-15s %-10s %s\n", input[i]["first_name"], input[i]["last_name"], input[i]["email"], input[i]["home_phone"],
  #           input[i]["street"], input[i]["city"], input[i]["state"], input[i]["zipcode"]
  #     i += 1
  #
  #   end
  # end
end

# o = Output.new
# o.print_queue([{"first_name"=>"Sarah",
#             "last_name"=>"Riordan",
#             "email"=>"ctuhspugha@jumpstartlab.com",
#             "home_phone"=>"7202058000",
#             "street"=>"2814 Tennyson St.",
#             "city"=>"Denver",
#             "state"=>"CO",
#             "zipcode"=>"80212"},
#             {"first_name"=>"Sarah",
#             "last_name"=>"Hough",
#             "email"=>"gi@jumpstartlab.com",
#             "home_phone"=>"2036506000",
#             "street"=>"42c Powder Mill Drive",
#             "city"=>"Stratford",
#             "state"=>"CT",
#             "zipcode"=>"06614"}])
