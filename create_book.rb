require './book'
require './book_store'

# Add book class
class AddBook
  def initialize(books)
    @books = books
  end

  def add_book
    print 'Publisher:'
    publisher = gets.chomp.strip.capitalize
    print 'cover_state:  '
    cover_state = gets.chomp.strip.capitalize
    print 'publish_date:  '
    publish_date = gets.chomp
    @books << Book.new(publisher, cover_state, publish_date)
    print('Book created successfully', 'Happy learning\n')
  end
end
