require 'date'
class Item
  attr_accessor :author, :source, :genre, :label

  def initialize(publish_date, id = Random.rand(1..1000), archived: false)
    @publish_date = publish_date
    @archived = archived
    @id = id
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_date = Date.today
    pub_date = Date.strptime(@publish_date, "%Y-%m-%d")
    calculated_date = current_date.year - pub_date.year
    return true if calculated_date > 10

    false
  end
end
