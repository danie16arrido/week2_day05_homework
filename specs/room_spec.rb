require('minitest/autorun')
require('minitest/emoji')
require_relative("../room.rb")

class TestRoom < MiniTest::Test

  def setup
    @room1 = Room.new("Folk", 9)
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
  
  def test_room_has_a_capacity
    assert_equal(9, @room1.capacity)
  end

  def test_room_can_chek_in_guest
    @room1.check_in_guest("Im a guest")
    assert_equal(1, @room1.guests_in_room.count())
  end

  def test_can_check_out_guest
    @room1.check_in_guest("Im a guest")
    assert_equal(1, @room1.guests_in_room.count())
    @room1.check_out_guest("Im a guest")
    assert_equal(0, @room1.guests_in_room.count())
  end

  def test_can_add_song_to_playlist
    @room1.add_song("a song")
    assert_equal(1, @room1.playlist.count())
  end

  def test_places_available_in_room
    @room1.check_in_guest("me")
    assert_equal(8, @room1.places_available)
  end

end