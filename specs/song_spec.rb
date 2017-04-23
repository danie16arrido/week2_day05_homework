require('minitest/autorun')
require('minitest/emoji')
require_relative("../song.rb")

class TestSong < MiniTest::Test

def setup
  @song1 = Song.new
end

def test_can_create_song_class
  assert_equal(Song, @song1.class)
end


end