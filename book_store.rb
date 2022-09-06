require 'json'
require './book'

# the book module
module BookStore
  def load_books
    book_store = []
    book_file = open('./books.json')
    if File.exist?(book_file) && File.read(book_file) != ''
      data = book_file.read
      JSON.parse(data).each do |book|
        book_store << Book.new(book['id'], book['publisher'], book['cover_state'])
      end
    else
      File.write(book_file, '[]')
    end
    book_store
  end

  def save_books_to_file
    book_store = []
    @books.each do |book|
      book_store << { id: book.id, publisher: book.publisher, cover_state: book.cover_state }
    end
    File.write('./books.json', book_store.to_json)
  end
end
