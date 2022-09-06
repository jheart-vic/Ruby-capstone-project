require_relative './genre'

module GenreMenuMethods
  def list_all_genre
    if @genres.empty?
      puts_message 'No genre listed in the collection'
      return
    end
    @genres.each_with_index do |genre, index|
      puts "No.#{index + 1}) Genre_id: #{genre.id} Genre: #{genre.name}"
    end
  end
  
  def create_genre
    genre = ''
    if @genres.empty?
      genre_name = get_user_input "No exising genre to choose from!\n\nEnter album genre: "
      genre = Genre.new(genre_name)
    else 
      choose_genre = lambda do
        option = get_user_input "Please choose one of the options below(1 or 2):\n1. Existing genre\n2. Create new genre:\nAlbum genre: "
        case option.to_i
        when 1        
          list_all_genre
          genre_id = get_user_input "Choose any genre by Id from the list above: "
          genre = @genres.find { |genre| genre.id == genre_id.to_i }
        when 2
          genre_name = get_user_input "Enter new album genre: "
          genre = Genre.new(genre_name)
        else
          choose_genre.call
        end
      end
      choose_genre.call
    end
    genre   
  end
end
