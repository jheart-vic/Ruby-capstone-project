class ListGames
  def initialize(game_list)
    @game_list = game_list
  end

  def list_games
    @game_list.each do |game|
      puts "GameID: #{game.id} Label: #{game.label.name} Genre: #{game.genre.name} Author: #{game.author.first_name} #{game.author.last_name} Last Played: #{game.last_played_at}\n" 
    end
  end
end
