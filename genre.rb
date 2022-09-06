class Genre
  def initialize(name = 'unknown', id = rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end
end