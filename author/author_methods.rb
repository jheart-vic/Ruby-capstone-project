require './author/author'
module AuthorModule
  def get_author()
    puts 'Which author is this game for?'

    if @author_list.empty?
      puts 'There are no authors to select from'
    else
      puts 'Select an author choosing the number:'
      loop do
        list_authors

        choice = gets.chomp.to_i
        return @author_list[choice - 1] if choice.positive? && choice <= @author_list.length

        puts 'Invalid input: please enter a number from the list.'
        puts 'Do you want to create a new author? [y/n]'
        case gets.chomp.downcase
        when 'y'
          break
        when 'n'
          next
        end
      end
    end
    CreateAuthor.new.return_author
  end

  def list_authors
    puts "AUTHOR LISTS:\n"
    @author_list.each_with_index do |author, index|
      puts "#{index + 1}. #{author.first_name} #{author.last_name}\n"
    end
    puts "\n"
  end
end