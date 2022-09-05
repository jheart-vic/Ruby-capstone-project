class Item
  attr_accessor :author, :source, :genre, :label

  def intialize(publish_date, archived = false, id = Random.rand(1..1000))
    @publish_date = publish_date
    @archived = archived
  end
  
  def move_to_archive
    @archived = true if can_be_archived?
  end  

  private

  def can_be_archived?   
    current_date = Date.strptime(publish_date, "%Y-%m-%d")
    calculated_date = current_date - @publish_date
    return true if calculated_date > 10
  
    false
  end
end
