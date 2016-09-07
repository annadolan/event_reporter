require "./lib/cleaner"
require "minitest/autorun"
require "minitest/pride"

class CleanerTest < Minitest::Test

  def test_first_name_is_cleaned_and_capitalized
    c = Cleaner.new
    assert_equal "Anna", c.clean_first_name("an.nA")
    assert_equal "Tonetta", c.clean_first_name("TonEtt''a")
    assert_equal "Bonnie", c.clean_first_name("bO999nnI.e")
    assert_equal "", c.clean_first_name(nil)
  end

  def test_last_name_is_cleaned_and_capitalized
    c = Cleaner.new
    assert_equal "Dolan", c.clean_last_name("DO//La.n")
    assert_equal "Foster", c.clean_last_name("foSt6er;")
  end

  def test_email_is_returned_as_a_string
    c = Cleaner.new
    assert_equal "987654.32", c.clean_email(987654.32)
  end

  def test_phone_number_is_cleaned
    c = Cleaner.new
    assert_equal "0000000000", c.clean_phone(nil)
    assert_equal "7202720069", c.clean_phone("720/272;0069")
    assert_equal "0000064521", c.clean_phone("645.21")
  end

  def test_street_is_capitalized_properly
    c = Cleaner.new
    assert_equal "469 S. Corona St.", c.clean_street("469 s. corona st.")
  end

  def test_city_is_cleaned_and_capitalized
    c = Cleaner.new
    assert_equal "Denver", c.clean_city("denver.")
    assert_equal "Boulder", c.clean_city("bo.u9lder")
    assert_equal "", c.clean_city(nil)
  end

  def test_state_is_cleaned_and_upcase
    c = Cleaner.new
    assert_equal "CO", c.clean_state("c9o...")
    assert_equal "", c.clean_state(nil)
  end

  def test_zip_code_is_cleaned
    c = Cleaner.new
    assert_equal "80209", c.clean_zipcode(80209)
    assert_equal "80209", c.clean_zipcode("80.20/9")
    assert_equal "00000", c.clean_zipcode(nil)
    assert_equal "80209", c.clean_zipcode("80a2ho09")
  end


end
