require './item'
class Game < Item
  def initialize(publish_date, multiplayer, last_played_at, id = Random.rand(1..1000), archived: false)
    super(publish_date, id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at # #date object: date_format: YYYY-mm-dd
  end

  private

  def can_be_archived?
    return false if @last_played_at.nil?

    @last_played_at.next_year(2) > Date.today && super
  end
end
