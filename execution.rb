require './games/add_game'
require './create_book'
require './list_books'
require './book_store'
class Execution
  include BookStore

  attr_accessor :game_list

  def initialize
    @game_list = []
    @author_list = []
    @books = load_books
    @labels = []
    @genres = []
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
end
