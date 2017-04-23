require('minitest/autorun')
require('minitest/emoji')
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup
    @room1 = Room.new("Folk", 9)
    @guest1 = Guest.new("JD")
    @song1 = Song.new("Seek and Destroy", "Metallica", 170, :trash_metal, 5)
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
    @room1.check_in_guest(@guest1)
    assert_equal(1, @room1.guests_in_room.count())
  end

  def test_can_check_out_guest
    @room1.check_in_guest(@guest1)
    assert_equal(1, @room1.guests_in_room.count())
    @room1.check_out_guest(@guest1)
    assert_equal(0, @room1.guests_in_room.count())
  end

  def test_can_add_song_to_playlist
    @room1.add_song("a song")
    assert_equal(1, @room1.playlist.count())
  end

  def test_places_available_in_room
    @room1.check_in_guest(@guest1)
    assert_equal(8, @room1.places_available)
  end

  def test_can_set_entry_fee
    @room1.entry_fee = 30
    assert_equal(30, @room1.entry_fee)
  end

  def test_whoos_when_adding_song_to_playlist
    @room1.check_in_guest(@guest1)
    @guest1.favourite_song = "Seek and Destroy"
    song_to_playlist = @room1.add_song(@song1) 
    assert_equal("whoo", song_to_playlist)
  end

















end