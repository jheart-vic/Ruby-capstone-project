class Genre
  def initialize(id = rand(1..1000), name = 'unknown')
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @item << item
  end
end