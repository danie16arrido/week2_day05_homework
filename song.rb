class Song

  attr_reader :name, :artist

  def initialize(song_name, artist_name)
    @name = song_name
    @artist = artist_name
  end
end