class Genre
  attr_accessor :items, :name
  attr_reader :id
  def initialize(id = rand(1..1000), name = 'unknown')
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end
end
