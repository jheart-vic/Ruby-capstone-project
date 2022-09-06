module GenreMenuMethods
  def list_all_genre
    if @genres.empty?
      puts_message 'No genre listed in the collection'
      return
    end
    @genres.each do |genre|
      puts_message "No. #{@genres.length + 1} - Genre: #{genre.name}"
    end
  end
end
