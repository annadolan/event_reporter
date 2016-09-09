require "./lib/cleaner"
require "minitest/autorun"
require "minitest/pride"

class CleanerTest < Minitest::Test
  include Cleaner
  def test_first_name_is_cleaned_and_capitalized
    assert_equal "Anna", clean_first_name("an.nA")
    assert_equal "Tonetta", clean_first_name("TonEtt''a")
    assert_equal "Bonnie", clean_first_name("bO999nnI.e")
    assert_equal "", clean_first_name(nil)
  end

  def test_last_name_is_cleaned_and_capitalized
    assert_equal "Dolan", clean_last_name("DO//La.n")
    assert_equal "Foster", clean_last_name("foSt6er;")
  end

  def test_email_is_returned_as_a_string
    assert_equal "987654.32", clean_email(987654.32)
  end

  def test_phone_number_is_cleaned
    assert_equal "0000000000", clean_phone(nil)
    assert_equal "7202720069", clean_phone("720/272;0069")
    assert_equal "0000064521", clean_phone("645.21")
  end

  def test_street_is_capitalized_properly
    assert_equal "469 S. Corona St.", clean_street("469 s. corona st.")
  end

  def test_city_is_cleaned_and_capitalized
    assert_equal "Denver", clean_city("denver.")
    assert_equal "Boulder", clean_city("bo.u9lder")
    assert_equal "", clean_city(nil)
  end

  def test_state_is_cleaned_and_upcase
    assert_equal "CO", clean_state("c9o...")
    assert_equal "", clean_state(nil)
  end

  def test_zip_code_is_cleaned
    assert_equal "80209", clean_zipcode(80209)
    assert_equal "80209", clean_zipcode("80.20/9")
    assert_equal "00000", clean_zipcode(nil)
    assert_equal "80209", clean_zipcode("80a2ho09")
  end


end
