class Genre
  attr_reader :items, :name
  def initialize(name = 'unknown', id = rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
