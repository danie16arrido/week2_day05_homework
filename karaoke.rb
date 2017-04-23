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

end