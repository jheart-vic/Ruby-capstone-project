# frozen_string_literal: true

require './item'

# the Label class
class Label < Item
  # the Label class
  attr_accessor :title, :color
  attr_reader :item

  def initialize(id, title, color)
    super()
    @id = id || Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    Item.label = self
  end
end
