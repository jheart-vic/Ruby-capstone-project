require './games/add_game'
require './create_book'
require './book_store'
require './list_books'
require './music_album/music_album_menu_methods'
require './genre/Genre_menu_methods'

class Execution
  include BookStore
  include MusicAlbumMenuMethods
  include GenreMenuMethods

  attr_accessor :game_list

  def initialize
    @game_list = []
    @author_list = []
    @books = load_books
    @labels = []
    @genres = []
    @music_album = []
  end

  def add_game
    AddGame.new(@game_list).add_game
  end

  def create_book
    AddBook.new(@books).add_book
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
