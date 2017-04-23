require('minitest/autorun')
require('minitest/emoji')
require_relative("../karaoke.rb")
require_relative("../room.rb")

class TestKaraoke < MiniTest::Test

  def setup
    @karaoke1 = Karaoke.new
    @room1 = Room.new("Heavy Metal", 666)
  end

  def test_can_create_karaoke
    assert_equal(Karaoke, @karaoke1.class)
  end

  def test_can_store_rooms
    assert_equal([], @karaoke1.rooms)
  end

  def test_can_add_room
    @karaoke1.add_room(@room1)
    assert_equal(1, @karaoke1.rooms.count())
  end

  def test_there_is_a_global_playlist
    assert_equal([], @karaoke1.global_playlist)
  end


end