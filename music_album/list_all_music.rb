require 'date'
require_relative 'music_album'

module ListAllMusic
  

  def add_music_album(publish_date, on_spotify)
    publish_date = get_user_input "Please enter the album publish date(yy/mm/dd): "
    album = MusicAlbum.new(publish_date, on_spotify: on_spotify)
    @music_album << album
  end


  def get_user_input(key = '')
    puts "\n"
    print key
    gets.chomp
  end
end

publish_date = Date.parse("2012-04-04")
album = MusicAlbum.new(publish_date, on_spotify: true)

p album