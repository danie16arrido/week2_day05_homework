class Song

  attr_reader :name, :artist, :duration, :category, :popularity

  def initialize(song_name, artist_name, duration, category, popularity)
    @name = song_name
    @artist = artist_name
    @duration = duration
    @category = category
    @popularity = popularity
  end
end