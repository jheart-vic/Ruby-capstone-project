require './item'

# the book class
class Book < Item
  attr_accessor :publisher

  def initialize(publisher, cover_state, publish_date, id = Random.rand(1...1000), archived: false)
    super(publish_date, id, archived: archived)
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
