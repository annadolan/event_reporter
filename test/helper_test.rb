require 'minitest/autorun'
require 'minitest/pride'
require './lib/helper'

class HelperTest < Minitest::Test
  include Helper
  def test_help_no_input
    assert_equal "Available commands: load, find, queue count, queue clear, queue district, queue print, queue print by, queue save to", run_help(nil)
  end

  def test_help_find
    assert_equal "Use the find command to find items with a specific attribute.", run_help("find")
  end

  def test_help_load
    assert_equal "Erases any loaded data and parses specified file", run_help("load")
  end

  def test_help_queue_bad_input
    assert_equal "Not a valid command. Please try another.", run_help("bork")
  end

  def test_help_queue_count
    assert_equal "Counts items in queue", help_queue("count")
  end

  def test_help_clear_queue
    assert_equal "Clears queue", help_queue("clear")
  end

  def test_help_queue_district
    assert_equal "Uses Sunlight API to get Congressional District", help_queue("district")
  end

  def test_help_queue_print
    assert_equal "Prints items in queue, by attribute or criteria if specified", help_queue("print")
  end

  def test_help_queue_save
    assert_equal "Saves items to a CSV file with given file name", help_queue("save")
  end

  def test_help_queue_export
    assert_equal "Exports current queue to an HTML file", help_queue("export")
  end

  def test_help_queue_bad_input
    assert_equal "Not a valid command. Please try another.", help_queue("blurgh")
  end
end
