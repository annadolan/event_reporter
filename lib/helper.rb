module Helper

  def run_help(input, input2 = nil)
    case input
    when nil     then output = "Available commands: load, find, queue count, queue clear, queue district, queue print, queue print by, queue save to"
    when "queue" then help_queue(input2)
    when "find"  then output = "Use the find command to find items with a specific attribute."
    when "load"  then output = "Erases any loaded data and parses specified file"
    else              output = "Not a valid command. Please try another."
    end
    puts output
    output
  end

  def help_queue(input2)
    case input2
    when "count"    then output = "Counts items in queue"
    when "clear"    then output = "Clears queue"
    when "district" then output = "Uses Sunlight API to get Congressional District"
    when "print"    then output = "Prints items in queue, by attribute or criteria if specified"
    when "save"     then output = "Saves items to a CSV file with given file name"
    when "export"   then output = "Exports current queue to an HTML file"
    else                 output = "Not a valid command. Please try another."
    end
    puts output
    output
  end
end
