class Item
  def intialize(author, genre, label, publish_date, source, id = Random.rand(1..1000))
    @author = author
    @genre = genre
    @label = label
    @publish_date = publish_date
    @source = source
    @archive = false
  end
  
  def can_be_archived
    # Date::strptime(publish_date, "%Y-%m-%d")
    current_date = Date.strptime(publish_date, "%Y-%m-%d")
    calculated_date = current_date - @publish_date
    return true if calculated_date > 10
  
    false
  end
  private :can_be_archived
end
