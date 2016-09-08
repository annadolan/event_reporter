require 'minitest/autorun'
require 'minitest/pride'
require './lib/helper'

class HelperTest < Minitest::Test
  def test_help_no_input
    h = Helper.new
    assert_equal "Available commands: load, find, queue count, queue clear, queue district, queue print, queue print by, queue save to", h.run_help(nil)
  end

  def test_help_queue_count
    h = Helper.new
    assert_equal "Counts items in queue", h.run_help("queue", "count")
  end
end
