require_relative '../item'

class MusicAlbum < Item
  def initialize(publish_date, on_spotify: false, id: Random.rand(1..1000), archived: false)
    super(publish_date, id, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super and @on_spotify
  end
end
