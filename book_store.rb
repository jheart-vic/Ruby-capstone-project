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
        book_store << Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['id'], book['archived'])
      end
    else
      File.write(book_file, '[]')
    end
    book_store
  end

  def save_books_to_file
    book_store = []
    @books.each do |book|
      book_store << { publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date, id: book.id, archived: book.archived }
    end
    File.write('./books.json', book_store.to_json)
  end
end
