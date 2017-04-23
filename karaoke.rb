class Karaoke
  
  attr_reader :rooms
  
  def initialize
    @rooms = []
  end

  def add_room(a_room)
    @rooms << a_room
  end

end