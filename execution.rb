require './games/add_game'
require './games/list_games'
require './create_book'
require './book_store'
class Execution
    include BookStore
    
    def initialize
        @game_list = []
        @author_list = []
        @books = load_books
        @labels = []
        @genres = []
        @author_list = []
    end

    def add_game
        AddGame.new(self).add_game
    end

    def list_games
        ListGames.new(@game_list).list_games
    end

    def create_book
        AddBook.new(@books).add_book
    end

    def list_authors
        ListAuthors.new(@author_list).list_authors
    end
end