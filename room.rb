class Room
  attr_reader :name, :guests_in_room, :playlist, :capacity

  def initialize(a_name, capacity)
    @name = a_name
    @guests_in_room = []
    @playlist = []
    @capacity = capacity
  end

  def check_in_guest(a_guest)
    @guests_in_room << a_guest
  end

  def check_out_guest(a_guest)
    @guests_in_room.delete(a_guest)
  end

  def add_song(a_song)
    @playlist << a_song
  end








end

