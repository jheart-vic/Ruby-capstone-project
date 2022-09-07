require 'date'
require './games/game'
class AddGame
  attr_reader :context

  def initialize(ctx)
    @context = ctx
  end

  def add_game
    multiplayer = multiplayer?
    last_played_at = obtain_last_played_at
    publish_date = obtain_publish_date

    game_instance = Game.new(publish_date, multiplayer, last_played_at)

    game_instance.genre = game_instance.get_genre(@context)
    game_instance.label = game_instance.get_label(@context)
    game_instance.author = game_instance.get_author(@context)

    @context.game_list << game_instance
    @context.author_list << game_instance.author

    game_instance
  end

  def multiplayer?
    loop do
      puts 'Is this game a multiplayer game? [y / n]'
      answer = gets.chomp

      case answer
      when 'y'
        return true
      when 'n'
        return false
      else
        puts 'Invalid input: type [y / n]'
      end
    end
  end

  def obtain_last_played_at
    loop do
      puts 'When was it last played? (yyyy-mm-dd)'
      last_played_at = validate_date(gets.chomp.to_s)
      return last_played_at if last_played_at

      puts 'Invalid Date or format: please enter correct date'
      puts "\n"
    end
  end

  def obtain_publish_date
    loop do
      puts 'What is the publish date of this game [yyyy-mm-dd]'
      publish_date = validate_date(gets.chomp.to_s)
      return publish_date if publish_date

      puts 'Invalid Date or format: please enter correct date'
      puts "\n"
    end
  end

  def validate_date(date)
    Date.parse(date)
  rescue StandardError
    false
  end
end
