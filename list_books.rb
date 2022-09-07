require './book'
require './book_store'

class ListBook
  def initialize(books)
    @books = books
  end

  def list_all_books
    puts 'Books'.upcase
    if @books.length.positive?
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Publisher: #{book.publisher},
               cover_state: #{book.cover_state},
               Published_date: #{book.publish_date}"
      end

    else
      print('There is no book to display', 'kindly add some books\n')
    end
  end
end
