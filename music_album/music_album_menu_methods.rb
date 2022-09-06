require 'date'
require_relative 'music_album'

module MusicAlbumMenuMethods  

  def add_music_album
    title = get_user_input "Album title: "
    publish_date = check_date_format
    on_spotify = is_on_spotify?

    album = MusicAlbum.new(publish_date, title, on_spotify: on_spotify)
    puts_message "Music album created successfully"
    @music_album << album
  end

  def list_all_music_album
    if @music_album.empty?
      puts_message 'No music album in the collection'
      return
    end
    @music_album.each do |album|
      on_spotify = album.on_spotify ? "Yes" : "No" 
      puts_message "ID:#{album.id} | Album title: #{album.title} | Release date:#{album.publish_date} | on spotify:#{on_spotify}"
    end
  end

  private

  def check_date_format
    check_date = lambda do
      date = get_user_input "Album publish date(yy/mm/dd): "      
      if validate_date(date)
        return Date.parse(date)
      else
        puts_message 'Invalid Date or format: please enter correct date'        
        check_date.call
      end    
    end
    check_date.call
  end

  def is_on_spotify?
    spotify = lambda do
      on_spotify = get_user_input("Is this album, on spotify? y or n: ").downcase
      case on_spotify
      when 'n'
        return false        
      when 'y'
        return true
      else
        puts_message 'Please enter "y" for Yes or "n" for No'
        spotify.call
      end
    end
    spotify.call
  end 

  def get_user_input(key = '')
    puts "\n"
    print key
    gets.chomp
  end

  def puts_message(message)
    puts "\n"
    puts message
    puts "\n"
  end
end
