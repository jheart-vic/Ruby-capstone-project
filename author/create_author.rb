require './author/Author'
class CreateAuthor
  def initialize()
    puts 'What is the first name of the Author?'
    first_name = gets.chomp

    puts 'What is the last name of the Author?'
    last_name = gets.chomp
    @author = Author.new(first_name, last_name)
  end

  def return_author
    @author
  end
end
