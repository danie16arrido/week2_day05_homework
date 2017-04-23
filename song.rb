class Song

  attr_reader :name, :artist, :duration

  def initialize(song_name, artist_name, duration)
    @name = song_name
    @artist = artist_name
    @duration = duration
  end
end