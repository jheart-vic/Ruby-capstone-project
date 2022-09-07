class Author
  attr_reader :items, :first_name, :last_name

  def initialize(first_name, last_name, id = Random.rand(1..1000))
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
