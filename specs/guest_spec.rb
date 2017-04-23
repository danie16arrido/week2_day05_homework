require('minitest/autorun')
require('minitest/emoji')
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Dan")
    @guest = Guest.new("Ben")
  end

  def test_can_create_guest_class
    assert_equal(Guest, @guest1.class)
  end

  def test_can_get_guest_name
    assert_equal("Dan", @guest1.name)
  end

  def test_guest_is_not_in_a_group_when_created
    assert_equal(false, @guest.is_in_a_group)
  end

  def test_can_set_guest_as_part_of_a_group
    assert_equal(true, @guest.set_guest_group)
  end

  def test_can_unset_guest_as_part_of_a_group
    assert_equal(false, @guest.unset_guest_group)
  end

  def test_guest_has_group_id_cero_when_created
    assert_equal(0, @guest.group_id)
  end

  def test_add_guest_to_group_id
    @guest.add_to_group_id(1)
    assert_equal(1, @guest.group_id)
  end

  def test_guest_has_a_bill_when_cheked_in
    assert_equal(0, @guest.bill)
  end

  def test_can_add_to_guest_bill
    @guest1.charge_for(30)
    assert_equal(30, @guest1.bill)
  end

end