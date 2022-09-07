require 'date'
require './games/game'
class AddGame
    attr_reader :context
  def initialize(ctx)
    @context = ctx
  end

  def add_game
    multiplayer = get_is_multiplayer
    last_played_at = get_last_played_at
    publish_date = get_publish_date 
    
    game_instance = Game.new(publish_date,multiplayer, last_played_at)

    game_instance.genre= game_instance.get_genre(@context)
    game_instance.label= game_instance.get_label(@context)
    game_instance.author= game_instance.get_author(@context)

    @context.game_list << game_instance
    @context.author_list << game_instance.author
    
    return game_instance
  end

  def get_is_multiplayer
    loop do
        puts "Is this game a multiplayer game? [y / n]"
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

  def get_last_played_at
    loop do
        puts 'When was it last played? (yyyy-mm-dd)'
        last_played_at = validate_date(gets.chomp.to_s)
        if last_played_at
            return last_played_at
        else
          puts 'Invalid Date or format: please enter correct date'
          puts "\n"
        end
    end
  end

  def get_publish_date
    loop do
        puts 'What is the publish date of this game [yyyy-mm-dd]'
        publish_date = validate_date(gets.chomp.to_s)
        if publish_date
            return publish_date
        else
          puts 'Invalid Date or format: please enter correct date'
          puts "\n"
        end
    end
  end

  def validate_date(date)
    Date.parse(date)
    rescue StandardError
        false
  end
end
