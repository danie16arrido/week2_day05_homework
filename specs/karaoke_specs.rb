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

  def test_can_store_items_to_sell
    assert_equal({}, @karaoke1.items_to_sell)
  end

  def test_can_add_items_to_sell
    joker_ipa = {beer: 5.2}
    list = {peanuts: 4.0, whiskey: 7.9}
    @karaoke1.add_items_to_sell(joker_ipa)
    @karaoke1.add_items_to_sell(list)
    assert_equal(5.2, @karaoke1.items_to_sell[:beer])
    assert_equal(7.9, @karaoke1.items_to_sell[:whiskey])
  end
end