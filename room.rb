class Room
  attr_reader :name, :guests_in_room, :playlist, :capacity

  def initialize(a_name, capacity)
    @name = a_name
    @guests_in_room = []
    @playlist = []
    @capacity = capacity
  end
end