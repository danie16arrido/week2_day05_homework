class Song

  attr_reader :name, :artist, :duration, :category

  def initialize(song_name, artist_name, duration, category)
    @name = song_name
    @artist = artist_name
    @duration = duration
    @category = category
  end
end