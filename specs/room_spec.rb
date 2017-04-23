require('minitest/autorun')
require('minitest/emoji')
require_relative("../room.rb")

class TestRoom < MiniTest::Test

  def setup
    @room1 = Room.new("Folk")
  end

  def test_can_create_room
    assert_equal(Room, @room1.class)
  end

  def test_can_get_room_name
    assert_equal("Folk", @room1.name)
  end

  def test_can_host_guests
    assert_equal([], @room1.guests_in_room)
  end

  def test_room_has_a_playlist
    assert_equal([], @room1.playlist)
  end

end