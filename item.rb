require 'date'

class Item
  attr_accessor :author, :genre, :label
  attr_reader :source, :id, :publish_date, :archived

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
    inputed_date = Date.parse(@publish_date)
    calculated_date = current_date - inputed_date
    calculated_date > 3650
  end
end
