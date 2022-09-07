require 'json'
require './book'
require './list_books'

module Store
  
  def load_all_data
    read_label
    read_genre
    read_author
    read_book
    read_games
    read_music_albums
  end

  def save_data
    books = create_book_object(@books)
    music = create_music_object(@music_album)
    games = create_game_object(@game_list)
    labels = create_label_object(@labels)
    author = create_author_object(@author_list)
    genres = create_genre_object(@genres)

    save_to_file(books, "./data/books.json")
    save_to_file(music, "./data/music_albums.json")
    save_to_file(games, "./data/games.json")
    save_to_file(labels, "./data/labels.json")
    save_to_file(author, "./data/author.json")
    save_to_file(genres, "./data/genres.json")
  end

  def read_data(file_name)
    file = open(file_name)
    if File.exist?(file) && File.read(file) != ''
      data = file.read
      JSON.parse(data)
    else
      []
    end
  end

  def read_music_albums
    read_data("./data/music_albums.json").each do |music| 
     new_music = MusicAlbum.new(music["publish_date"], music["title"], on_spotify: music["on_spotify"], id: music["id"], archived: music["archived"])
      genre = @genres.find { |item| item.id == music["genre"]["id"]}      
      label = @labels.find { |item| item.id == music["label"]["id"]}
      author = @author_list.find { |item| item.id == music["author"]["id"]}
      genre.add_item(new_music)
      label.add_item(new_music)
      author.add_item(new_music)
      @music_album << new_music
    end
  end

  def read_games
    read_data("./data/games.json").each do |game| 
     new_game = Game.new(game["publisher"], game["cover_state"], game["publish_date"], game["id"], archived: game["archived"])
      genre = @genres.find { |item| item.id == game["genre"]["id"]}      
      label = @labels.find { |item| item.id == game["label"]["id"]}
      author = @author_list.find { |item| item.id == game["author"]["id"]}
      genre.add_item(new_game)
      label.add_item(new_game)
      author.add_item(new_game)
      @game_list << new_game
    end
  end

  def read_book
    read_data("./data/books.json").each do |book| 
      new_book = Book.new(book["publisher"], book["cover_state"], book["publish_date"], book["id"], archived: book["archived"])
      genre = @genres.find { |item| item.id == book["genre"]["id"]}      
      label = @labels.find { |item| item.id == book["label"]["id"]}
      author = @author_list.find { |item| item.id == book["author"]["id"]}
      genre.add_item(new_book)
      label.add_item(new_book)
      author.add_item(new_book)
      @books << new_book
    end
  end  

  #labels
  def read_label
    @labels = read_data("./data/labels.json").map do |label| 
      Label.new(label["title"], label["color"], label["id"])
    end
  end
  
  def read_genre
    @genres = read_data("./data/genres.json").map do |genre| 
      Genre.new(genre["name"], genre["id"])
    end
  end
  
  def read_author
    @author_list = read_data("./data/author.json").map do |author| 
      Author.new(author["first_name"], author["last_name"], author["id"])
    end
  end

  def create_book_object(book_array)
    result = book_array.map do |book| 
      { id: book.id, publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date,
        archived: book.archived, label: {id: book.label.id, title: book.label.title, color: book.label.color}, genre: {id: book.genre.id, name: book.genre.name},
        author: {id: book.author.id, first_name: book.author.first_name, last_name: book.author.last_name} }
    end
  end

  def create_music_object(music_array)
    result = music_array.map do |music| 
      { id: music.id,  publish_date: music.publish_date, title: music.title, on_spotify: music.on_spotify,
       archived: music.archived, label: {id: music.label.id, title: music.label.title, color: music.label.color},
       author: {id: music.author.id, first_name: music.author.first_name, last_name: music.author.last_name},
       genre: {id: music.genre.id, name: music.genre.name} }
    end
  end

  def create_game_object(game_array)
    result = game_array.map do |game| 
      { id: game.id, publish_date: game.publish_date, multiplayer: game.multiplayer,
        genre: {id: game.genre.id, name: game.genre.name}, archived: game.archived,
        label: {id: game.label.id, title: game.label.title, color: game.label.color},
        last_played_at: game.last_played_at, author: {id: game.author.id,
        first_name: game.author.first_name, last_name: game.author.last_name}}
    end
  end

  def create_label_object(label_array)
    result = label_array.map do |label| 
      { id: label.id, title: label.title, color: label.color }
    end
  end

  def create_author_object(author_array)
    result = author_array.map do |author| 
      { id: author.id, first_name: author.first_name, last_name: author.last_name }
    end
  end

  def create_genre_object(genre_array)
    result = genre_array.map do |genre| 
      { id: genre.id, name: genre.name }
    end
  end

  def save_to_file(array, file_name)
    File.write(file_name, array.to_json)
  end
end
