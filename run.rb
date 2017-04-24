require('minitest/autorun')
require('minitest/emoji')
require_relative("./karaoke.rb")
require_relative("./room.rb")
require_relative("./guest.rb")
require_relative("./song.rb")
require_relative("./menu.rb")

@karoke = Karaoke.new

@trash_metal_room = Room.new("trash", 9)
@trash_metal_room.entry_fee = 30
@black_metal_room = Room.new("black", 10)
@black_metal_room.entry_fee = 23
@symphonic_metal_room = Room.new("symphonic", 8)
@symphonic_metal_room.entry_fee = 20

@song1 = Song.new("Paranoid", "Black Sabbath", 170, "Heavy Metal", 5)
@song2 = Song.new("Freezing Moon", "Mayhem", 190, "Black Metal", 5)
@song3 = Song.new("Dunkelheit", "Burzum", 100, "Black Metal", 5)
@song4 = Song.new("Enter The Eternal Fire", "Bathory", 150, "Black Metal", 5)
@song5 = Song.new("Call of the Winter Moon", "Immortal", 144, "Black Metal", 5)
@song6 = Song.new("Kings Of The Carnival Creation", "Dimmu Borgir", 270, "Black Metal", 5)

available_today = {
  beer: 4.0,
  cider: 5.0,
  whisky: 7.8,
  peanuts: 3.5,
  prosecco: 4.5,
  shot: 3.7
}

@karoke.add_items_to_sell(available_today)

@guest1 = Guest.new("Daniel")
@guest2 = Guest.new("Peter")
@guest3 = Guest.new("Mary")
@guest4 = Guest.new("John")
@guest5 = Guest.new("Jane")

@main_menu = Menu.new("Main")
list = ["Guest Menu", "Karaoke Manager Menu", "Quit"]
@main_menu.add_item(list)
@main_menu.message = "Welcome to Karaoke-Land"

@guest_menu = Menu.new("Guest")
submenu1 = ["Buy from the bar", "Add a song","Pay bill","Main Menu"]
@guest_menu.add_item(submenu1)
@guest_menu.message = "Guest Menu"

@manager_menu = Menu.new("Karaoke Manager")
submenu2 = [
  "Check in guests",
  "Check out guests",
  "Add new song",
  "Add a room",
  "Add items to sell",
  "Main menu"
]
@manager_menu.add_item(submenu2)
@manager_menu.message = "Manager Menu"

@bar_menu = Menu.new("Bar Menu")
submenu11 = []
available_today.each do |k, v|
  submenu11 << k.to_s
end
@bar_menu.add_item(submenu11)
@bar_menu.add_item("Quit")
@bar_menu.message = "Bar Menu"

def get_the_party_started(a_karoke)
  @main_menu.pretty_print
  input = gets.chomp()
  while input != '3'
    if input == '1'
      @guest_menu.pretty_print
      input = gets.chomp()
      while input != @guest_menu.items.length.to_s 
        if input == '1'
          puts "am 1"
          @bar_menu.message = "What would you like to buy?"
          @bar_menu.pretty_print
          input = gets.chomp()
          while input != @bar_menu.items.length.to_s
            if input == '1'
              puts "I am buyin a beer"
            else
              puts ">>>> wrong option"
            end
            @bar_menu.pretty_print
            input = gets.chomp() 
          end
        elsif input == '2'
          puts "am 2"
        elsif input == '3'
          puts "am 3"
        else
          puts ">>>> Wrong option"
        end
        @guest_menu.pretty_print
        input = gets.chomp()    
      end
    elsif input == '2'
      @manager_menu.pretty_print
      input = gets.chomp()
      while input != @manager_menu.items.length.to_s 
        if input == '1'
          puts "am 1"
        elsif input == '2'
          puts "am 2"
        elsif input == '3'
          puts "am 3"
        elsif input == '4'
          puts "am 4"
        elsif input == '5'
          puts "am 5"
        else
          puts ">>>> Wrong option"
        end
        @manager_menu.pretty_print
        input = gets.chomp()    
      end 
    else
      puts "wrong option"
    end
    @main_menu.pretty_print
    input = gets.chomp()
  end
end

get_the_party_started(@karoke)


