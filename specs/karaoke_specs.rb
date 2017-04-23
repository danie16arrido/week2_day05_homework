require('minitest/autorun')
require('minitest/emoji')
require_relative("../karaoke.rb")
require_relative("../room.rb")
require_relative("../guest.rb")

class TestKaraoke < MiniTest::Test

  def setup
    @karaoke1 = Karaoke.new

    @room1 = Room.new("Heavy Metal", 666)
    
    @guest1 = Guest.new("Daniel")
    @guest2 = Guest.new("Peter")
    @guest3 = Guest.new("Ben")
    @group1 = [@guest1, @guest2, @guest3]
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

  def test_can_remove_items_after_running_out
    joker_ipa = {beer: 5.2}
    list = {peanuts: 4.0, whiskey: 7.9}
    @karaoke1.add_items_to_sell(joker_ipa)
    @karaoke1.add_items_to_sell(list)
    @karaoke1.delete_item_to_sell(:beer)
    assert_nil(@karaoke1.items_to_sell[:beer])
  end

  def test_can_checkin_group
    @karaoke1.check_in_group(@group1, 1, @room1)
    assert_equal(3, @room1.guests_in_room.count())
  end

end