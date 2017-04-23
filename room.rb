class Room
  attr_reader :name, :guests_in_room, :playlist, :capacity
  attr_accessor :entry_fee
  def initialize(a_name, capacity)
    @name = a_name
    @guests_in_room = []
    @playlist = []
    @capacity = capacity
    @entry_fee = 0
  end

  def check_in_guest(a_guest)
    @guests_in_room << a_guest
    a_guest.bill += @entry_fee
  end

  def check_out_guest(a_guest)
    @guests_in_room.delete(a_guest)
  end

  def add_song(a_song)
    @playlist << a_song
    check_reaction(a_song)
  end

  def places_available
    return (@capacity - @guests_in_room.count())
  end

  def check_reaction(a_song)
    reaction = ""
    @guests_in_room.each do |guest|
      if guest.favourite_song == a_song.name
        reaction = "whoo"
      end
    end
    return reaction
  end










end

