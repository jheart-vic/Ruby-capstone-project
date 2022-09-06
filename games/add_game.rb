require 'date'
require './games/game'
class AddGame
  def initialize(game_list)
    @game_list = game_list
  end

  def add_game
    puts 'What is the name of the game?'
    name = gets.chomp
    puts 'Is it multiplayer? (y/n)'
    response = gets.chomp
    multiplayer = response == 'y'

    check_date = lambda do
      puts 'When was it last played? (yyyy-mm-dd)'
      last_played_at = validate_date(gets.chomp.to_s)
      if last_played_at
        game = Game.new(name, multiplayer, last_played_at)
        @game_list << game
      else
        puts 'Invalid Date or format: please enter correct date'
        puts "\n"
        check_date.call
      end
    end
    check_date.call
  end

  def validate_date(date)
    Date.parse(date)
  rescue StandardError
    false
  end
end
