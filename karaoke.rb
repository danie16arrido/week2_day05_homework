class Karaoke
  
  attr_reader :rooms, :global_playlist, :items_to_sell
  
  def initialize
    @rooms = []
    @global_playlist = []
    @items_to_sell = {}
  end

  def add_room(a_room)
    @rooms << a_room
  end

  def add_items_to_sell(item)
    @items_to_sell.merge!(item)
  end

  def delete_item_to_sell(item)
    @items_to_sell.delete(item)
  end

  def check_in_group(a_group, group_id, a_room)
   a_group.each do |guest|
     a_room.check_in_guest(guest)
     guest.is_in_a_group = true
   end
  end

end