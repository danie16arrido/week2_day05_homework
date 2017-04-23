class Karaoke
  
  attr_reader :rooms, :global_playlist
  
  def initialize
    @rooms = []
    @global_playlist = []
  end

  def add_room(a_room)
    @rooms << a_room
  end

end