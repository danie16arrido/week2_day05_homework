require('minitest/autorun')
require('minitest/emoji')
require_relative("../song.rb")

class TestSong < MiniTest::Test

def setup
  @song1 = Song.new("Paranoid")
end

def test_can_create_song_class
  assert_equal(Song, @song1.class)
end

def test_can_get_song_name
  assert_equal("Paranoid", @song1.name)
end


end