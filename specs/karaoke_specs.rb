require('minitest/autorun')
require('minitest/emoji')
require_relative("../karaoke.rb")

class TestKaraoke < MiniTest::Test

def setup
  @karaoke1 = Karaoke.new
  @room1 = Room.new
end

def test_can_create_karaoke
  assert_equal(Karaoke, @karaoke1.class)
end

def test_can_store_rooms
  assert_equal([], @karaoke1.rooms)
end

def test_can_add_room
  @karaoke1.add_room()
  assert_equal(1, @karaoke1.rooms.count())
end


end