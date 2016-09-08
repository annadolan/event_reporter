require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'

class QueueTest < Minitest::Test
  
  def test_attendees_added_to_array
    q = Queue.new

    attendee = {"first_name"=>"Sarah",
                "last_name"=>"Riordan"}

    q.add_to_queue(attendee)

    assert_equal [attendee], q.queue

    attendee2 = {"first_name"=>"Sarah",
                "last_name"=>"Hough"}

    q.add_to_queue(attendee2)

    assert_equal [attendee, attendee2], q.queue
  end

  def test_queue_count
    q = Queue.new

    assert_equal 0, q.count_queue

    q.add_to_queue({"first_name" => "Anna"})

    assert_equal 1, q.count_queue

    q.add_to_queue({"first_name" => "Mary"})

    assert_equal 2, q.count_queue
  end

  def test_queue_district
    q = Queue.new
    attendee = {"first_name"=>"Anna",
                "zipcode" => "80203"}
    q.add_to_queue(attendee)

    attendee2 = {"first_name"=>"Sarah",
                "zipcode" => "80127"}
    q.add_to_queue(attendee2)

    assert_equal "1", q.queue_district[0]["district"]
    assert_equal "2", q.queue_district[1]["district"]
  end

  def test_clear_queue
    q = Queue.new
    attendee = {"first_name"=>"Sarah",
                "last_name"=>"Riordan"}
    q.add_to_queue(attendee)

    attendee2 = {"first_name"=>"Sarah",
                "last_name"=>"Hough"}
    q.add_to_queue(attendee2)

    assert_equal 2, q.count_queue

    q.clear_queue

    assert_equal 0, q.count_queue
  end
end
