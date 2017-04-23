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

  def test_guest_is_a_group
    @karaoke1.check_in_group(@group1, 1, @room1)
    assert_equal(true, @guest3.is_in_a_group) 
  end

  def test_guest_has_id_group_when_checking_in_a_group
    @karaoke1.check_in_group(@group1, 1, @room1)
    assert_equal(1, @guest2.group_id)
    assert_equal(1, @guest1.group_id)
  end

  def test_can_charge_guest_an_entry_fee
    @karaoke1.add_room(@room1)
    @room1.entry_fee = 30
    @karaoke1.check_in_group(@group1, 1, @room1)
    assert_equal(30, @guest1.bill)
  end

  def test_can_charge_guest_for_preloaded_item
    joker_ipa = {beer: 5.2}
    @karaoke1.add_items_to_sell(joker_ipa)
    @karaoke1.add_room(@room1)
    @room1.entry_fee = 30
    @room1.check_in_guest(@guest2)
    # a_beer = @karaoke1.items_to_sell[:beer]
    a_beer = @karaoke1.items_to_sell.assoc(:beer)
    @guest2.charge_for(a_beer)
    assert_equal(35.2, @guest2.bill) 
  end

  def test_add_detail_when_buying_item
    joker_ipa = {beer: 5.2}
    list = {peanuts: 4.0, whiskey: 7.9}
    @karaoke1.add_items_to_sell(joker_ipa)
    @karaoke1.add_items_to_sell(list)
    @karaoke1.add_room(@room1)
    @room1.entry_fee = 30
    @room1.check_in_guest(@guest2)
    a_beer = @karaoke1.items_to_sell.assoc(:beer)
    a_snack = @karaoke1.items_to_sell.assoc(:whiskey)
    a_shot= @karaoke1.items_to_sell.assoc(:peanuts)
    @guest2.charge_for(a_beer)
    @guest2.charge_for(a_snack)
    @guest2.charge_for(a_shot)
    @guest2.charge_for(a_beer)
    assert_equal(["beer", "whiskey", "peanuts", "beer"], @guest2.items_consumed) 
  end

  def test_pretty_bill
    joker_ipa = {beer: 5.2}
    list = {peanuts: 4.0, whiskey: 7.9}
    @karaoke1.add_items_to_sell(joker_ipa)
    @karaoke1.add_items_to_sell(list)
    @karaoke1.add_room(@room1)
    @room1.entry_fee = 30
    @room1.check_in_guest(@guest2)
    a_beer = @karaoke1.items_to_sell.assoc(:beer)
    a_snack = @karaoke1.items_to_sell.assoc(:whiskey)
    a_shot= @karaoke1.items_to_sell.assoc(:peanuts)
    @guest2.charge_for(a_beer)
    @guest2.charge_for(a_snack)
    @guest2.charge_for(a_shot)
    @guest2.charge_for(a_beer)

    @guest2.pretty_bill

  end
















end
















