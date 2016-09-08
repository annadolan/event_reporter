require 'pry'
class Helper

  def run_help(input, input2 = nil)
    if input.nil?
      output = "Available commands: load, find, queue count, queue clear, queue district, queue print, queue print by, queue save to"
    elsif input == "queue"
      help_queue(input2)
    elsif input == "find"
      output = "Use the find command to find items with a specific attribute."
    elsif input == "load"
      output = "Erases any loaded data and parses specified file"
    end
    puts output
    output
  end

  def help_queue(input2)
    case input2
    when "count"
      output = "Counts items in queue"
    when "clear"
      output = "Clears queue"
    when "district"
      output = "Uses Sunlight API to get Congressional District"
    when "print"
      output = "Prints items in queue, by attribute or criteria if specified"
    when "save"
      output = "Saves items to a CSV file with given file name"
    when "export"
      output = "Exports current queue to an HTML file"
    end
    puts output
    output
  end
    # if input2 == "count"
    #   output = "Counts items in queue"
    # elsif input2 == "clear"
    #   output = "Clears queue"
    # elsif input2 == "district"
    #   output = "Uses Sunlight API to get Congressional District"
    # elsif input2 == "print"
    #   output = "Prints items in queue, by attribute or criteria if specified"
    # elsif input2 == "save"
    #   output = "Saves items to a CSV file with given file name"
    # elsif input2 == "export"
    #   output = "Exports current queue to an HTML file"
    # end
  #   puts output
  # end



end

 # h = Helper.new
 # h.run_help("queue", "count")
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
