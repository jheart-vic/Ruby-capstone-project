# frozen_string_literal: true

require './book'
require './book_store'

# Add book class
class CreateBook
  def initialize(books)
    @books = books
  end

  def create_book
    print 'Publisher:'
    publisher = gets.chomp.strip.capitalize
    print 'cover_state:  '
    cover_state = gets.chomp.strip.capitalize
    @books << Book.new(nil, publisher, cover_state)
    print('Book created successfully', 'Happy learning')
  end
end
