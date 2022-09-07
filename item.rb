require 'date'
class Item
  attr_accessor :author, :source, :genre, :label, :id, :publish_date, :archived

  def initialize(publish_date, id = Random.rand(1..1000), archived: false)
    @publish_date = publish_date
    @archived = archived
    @id = id
  end

  def author=(author)
    @author = author
    @author.add_item(self) unless @author.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
  end

  def label=(label)
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_date = Date.today
    calculated_date = current_date.year - @publish_date.year
    calculated_date > 10
  end
end
