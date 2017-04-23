class Room
  attr_reader :name, :guests_in_room, :playlist

  def initialize(a_name)
    @name = a_name
    @guests_in_room = []
    @playlist = []
  end
end