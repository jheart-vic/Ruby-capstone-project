# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
require './execution'
module Options
  def display_options
    execution = Execution.new
    loop do
      puts 'Please choose an option by entering a number:

        1 - List all books.
        2 - List all music albums.
        3 - List of games
        4 - List all genre
        5 - List all labels
        6 - List all authors
        7 - List all sources
        8 - Add a book
        9 - Add a music album
        10 - Add a game.
        0 - quit!'

      option = gets.chomp

      if number?(option)
        process_input(option.to_i, execution)
      else
        show_error
      end
    end
  end

  def number?(obj)
    obj = obj.to_s unless obj.is_a? String
    /\A[+-]?\d+(\.\d+)?\z/.match(obj)
  end

  def process_input(option, execution)
    case option

    when 1
      execution.list_all_books
    when 2
      execution.list_all_music_album
    when 3
      puts "OPtion 3 has been selected\n"
    when 4
      execution.list_all_genre
    when 5
      puts "OPtion 5 as been selected\n"
    when 6
      puts "OPtion 6 has been selected\n"
    when 7
      puts "OPtion 7 has been selected\n"
    when 8
      execution.create_book
    when 9
      execution.add_music_album
    when 10
      execution.add_game
    when 0
      quit
    else
      show_error
    end
  end

  def show_error
    puts 'Error! Please select a valid option.'
  end

  def quit
    # save your files to json
    puts 'saving your data ...'

    puts "Thanks for using Using The catalog of things\n"
    exit
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity
