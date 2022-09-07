require './games/add_game'
require './author/author_methods'
require './games/list_games'
require './author/list_authors'
require './create_book'
require './create_label'
require './store'
require './list_books'
require './music_album/music_album_menu_methods'
require './genre/Genre_menu_methods'

class Execution
  include Store
  include AddLabel
  include AddBook
  include MusicAlbumMenuMethods
  include GenreMenuMethods
  include AuthorModule
  include AddGame
  include ListBook

  attr_accessor :game_list

  def initialize
    @game_list = []
    @author_list = []
    @books = []
    @labels = []
    @genres = []
    @music_album = []
  end

  def list_games
    ListGames.new(@game_list).list_games
  end

  def validate_date(date)
    Date.parse(date)
  rescue StandardError
    false
  end
end
