require 'date'
class Item
  attr_accessor :author, :source, :genre, :label

  def initialize(publish_date, archived = false, id = Random.rand(1..1000))
    @publish_date = publish_date
    @archived = archived
    @id = id
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def can_be_archived?
    current_date = Date.today
    calculated_date = current_date.year - @publish_date.year
    return true if calculated_date > 10

    false
  end
end
