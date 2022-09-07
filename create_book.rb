require 'date'
require './book'
require './book_store'
require './create_label'
# Add book class
module AddBook
  include AddLabel
  # rubocop:disable Metrics/MethodLength:
  def add_book
    print 'Publisher:  '
    publisher = gets.chomp.strip.capitalize
    print 'cover_state:  '
    cover_state = gets.chomp.strip.capitalize
    label = create_label
    book = ''
    print 'publish_date:  '
    check_date = lambda do
      puts 'publish_date (yyyy-mm-dd):'
      publish_date = validate_date(gets.chomp.to_s)
      if publish_date
        book = Book.new(publisher, cover_state, publish_date)
        @books << book
        puts("Book created successfully', 'Happy learning\n")
      else
        puts 'Invalid Date or format: please enter correct date'
        puts "\n"
        check_date.call
      end
    end
    check_date.call
    label.add_item(book)
    @labels << label
  end

  def validate_date(date)
    Date.parse(date)
  rescue StandardError
    false
  end
end
# rubocop:enable Metrics/MethodLength:
