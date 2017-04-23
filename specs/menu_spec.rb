require('minitest/autorun')
require('minitest/emoji')
require_relative("../menu.rb")

class TestMenu < MiniTest::Test
  def setup 
    @menu_main = Menu.new("Main")
  end

  def test_can_create_menu
    assert_equal(Menu, @menu_main.class)
  end

  def test_can_get_name
    assert_equal("Main", @menu_main.name)
  end
end