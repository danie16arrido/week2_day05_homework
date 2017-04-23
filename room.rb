class Room
  attr_reader :name, :guests_in_room

  def initialize(a_name)
    @name = a_name
    @guests_in_room = []
  end
end