require 'pry'
require "./lib/manager"
require "./lib/helper"
require "./lib/queue"

class Looper
 include Helper

  def initialize
    @manager = Manager.new
  end

  def get_command
    input = gets.chomp
    input = input.downcase.gsub(/to | by | html/, " ").split(" ")

    @user_input   = input[0]
    @user_input_2 = input[1]
    @user_input_3 = [input[2..-1]].join(" ").to_s

    do_command
  end

  def do_command
    case @user_input
    when "load"  then run_load
    when "queue" then run_queue
    when "help"  then run_help(@user_input_2, @user_input_3)
    when "find"  then @manager.find(@user_input_2, @user_input_3)
    when "quit"  then return nil
    else puts "Not a valid command. Please try another."
    end
    get_command
  end

  def run_load
    if @user_input_2 == nil
      file_name = "event_attendees.csv"
    else
      file_name = @user_input_2
    end
    @manager.load_file(file_name)
    @manager.attendees
  end

  def run_queue
    case @user_input_2
    when "count"    then puts @manager.count_queue
    when "clear"    then @manager.clear_queue
    when "district" then @manager.queue_district
    when "print"
      if @user_input_3.nil?
        @manager.print_queue
      else
        @manager.queue_print_by(@user_input_3)
      end
    when "save"    then @manager.queue_save_to(@user_input_3)
    when "export"  then @manager.queue_export(@user_input_3)
    else puts "Not a valid command. Please try another."
    end
  end
end
