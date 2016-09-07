require "./lib/loader"
require "minitest/autorun"
require "minitest/pride"

class LoaderTest < Minitest::Test

  def test_csv_file_is_loaded
    loader = Loader.new

    assert_instance_of CSV, loader.load_file("event_attendees.csv")
  end



end
