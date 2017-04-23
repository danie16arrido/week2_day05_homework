require('minitest/autorun')
require('minitest/emoji')
require_relative("../menu.rb")

class TestMenu < MiniTest::Test
  def setup 
    @menu_main = Menu.new("Main Menu")
    @main = Menu.new("Main")
    list = ["Guest Menu", "Karaoke Manager Menu", "Quit"]
    @main.add_item(list)
    @main.message = "Welcome to Karaoke-Land"
  end

  def test_can_create_menu
    assert_equal(Menu, @menu_main.class)
  end

  def test_can_get_name
    assert_equal("Main Menu", @menu_main.name)
  end

  def test_can_add_menu_items

    @menu_main.add_item("Add song to playlist")
    @menu_main.add_item(["Buy a beer", "Buy snacks"])
    assert_equal(3, @menu_main.items.count())
  end

  def test_pretty_print
    @main.pretty_print
  end


end