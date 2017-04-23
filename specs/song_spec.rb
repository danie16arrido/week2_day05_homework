require('minitest/autorun')
require('minitest/emoji')
require_relative("../song.rb")

class TestSong < MiniTest::Test

def setup
  @song1 = Song.new("Paranoid", "Black Sabbath", 170)
end

def test_can_create_song_class
  assert_equal(Song, @song1.class)
end

def test_can_get_song_name
  assert_equal("Paranoid", @song1.name)
end

def test_can_get_artist
  assert_equal("Black Sabbath", @song1.artist)
end

def test_can_get_duration
  assert_equal(170, @song1.duration)
end


end