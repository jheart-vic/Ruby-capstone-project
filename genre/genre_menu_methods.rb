module GenreMenuMethods
  def list_all_genre
    if @genres.empty?
      puts_message 'No genre listed in the collection'
      return
    end
    @genres.each_with_index do |genre, index|
      puts_message "No. #{index + 1} - Genre: #{genre.name}"
    end
  end
end
