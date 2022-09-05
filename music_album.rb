require_relative './item'

class MusicAlbum < Item
  def initialize(publish_date, id = Random.rand(1..1000), on_spotify: false, archived: false)
    super(publish_date, id, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super and @on_spotify
  end
end

tu_face = MusicAlbum.new("2015-04-09", rand(1..1000), on_spotify: true)

p tu_face.can_be_archived?