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

end