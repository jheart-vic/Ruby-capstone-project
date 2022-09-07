require './games/add_game'
require './games/list_games'
require './author/list_authors'
require './create_book'
require './create_label'
require './book_store'
require './list_books'
require './music_album/music_album_menu_methods'
require './genre/Genre_menu_methods'

class Execution
  include BookStore
  include AddLabel
  include AddBook
  include MusicAlbumMenuMethods
  include GenreMenuMethods
  include AddGame

  attr_accessor :game_list

  def initialize
    @game_list = []
    @author_list = []
    @books = load_books
    @labels = []
    @genres = []
    @music_album = []
  end

  # def add_game
  #   AddGame.new(@game_list).add_game
  # end

  def list_games
    ListGames.new(@game_list).list_games
  end

  def list_authors
    ListAuthors.new(@author_list).list_authors
  end

  def list_all_books
    ListBook.new(@books).list_all_books
  end

  def validate_date(date)
    Date.parse(date)
  rescue StandardError
    false
  end
end
