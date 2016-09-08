require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'

class QueueTest < Minitest::Test
  def test_attendee_added_to_array
    q = Queue.new
    attendee = {"first_name"=>"Sarah",
                "last_name"=>"Riordan",
                "email"=>"ctuhspugha@jumpstartlab.com",
                "home_phone"=>"7202058000",
                "street"=>"2814 Tennyson St.",
                "city"=>"Denver",
                "state"=>"CO",
                "zipcode"=>"80212"}
    q.add_to_queue(attendee)
    assert_equal [attendee], q.queue

    attendee2 = {"first_name"=>"Sarah",
                "last_name"=>"Hough",
                "email"=>"gi@jumpstartlab.com",
                "home_phone"=>"2036506000",
                "street"=>"42c Powder Mill Drive",
                "city"=>"Stratford",
                "state"=>"CT",
                "zipcode"=>"06614"}
      q.add_to_queue(attendee2)
      assert_equal [attendee, attendee2], q.queue
  end

  def test_queue_count
    q = Queue.new
    assert_equal 0, q.count_queue
    q.add_to_queue({"first_name"=>"Anna"})
    assert_equal 1, q.count_queue
    q.add_to_queue({"first_name" => "Mary"})
    assert_equal 2, q.count_queue
  end

  def test_queue_district
    skip
    q = Queue.new

  end

  def test_clear_queue
    q = Queue.new
    attendee = {"first_name"=>"Sarah",
                "last_name"=>"Riordan",
                "email"=>"ctuhspugha@jumpstartlab.com",
                "home_phone"=>"7202058000",
                "street"=>"2814 Tennyson St.",
                "city"=>"Denver",
                "state"=>"CO",
                "zipcode"=>"80212"}
    q.add_to_queue(attendee)
    attendee2 = {"first_name"=>"Sarah",
                "last_name"=>"Hough",
                "email"=>"gi@jumpstartlab.com",
                "home_phone"=>"2036506000",
                "street"=>"42c Powder Mill Drive",
                "city"=>"Stratford",
                "state"=>"CT",
                "zipcode"=>"06614"}
    q.add_to_queue(attendee2)

    assert_equal 2, q.count_queue

    q.clear_queue
    assert_equal 0, q.count_queue
  end

  def test_print_queue
    skip
    q = Queue.new
    attendee = {"first_name"=>"Sarah",
                "last_name"=>"Riordan",
                "email"=>"ctuhspugha@jumpstartlab.com",
                "home_phone"=>"7202058000",
                "street"=>"2814 Tennyson St.",
                "city"=>"Denver",
                "state"=>"CO",
                "zipcode"=>"80212"}
    q.add_to_queue(attendee)


end
