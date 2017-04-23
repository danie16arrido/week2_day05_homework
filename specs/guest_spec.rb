require('minitest/autorun')
require('minitest/emoji')
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Dan")
  end

  def test_can_create_guest_class
    assert_equal(Guest, @guest1.class)
  end

  def test_can_get_guest_name
    assert_equal("Dan", @guest1.name)
  end

end