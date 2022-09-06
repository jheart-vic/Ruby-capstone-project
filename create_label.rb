# frozen_string_literal: true

require './label'
require './label_store'

# the label class
class AddLabel
  def initialize(labels)
    @labels = labels
  end

  def add_label
    print 'Title'
    title = gets.chomp.strip.capitalize
    print 'Color'
    color = gets.chomp.strip.capitalize
    @labels << Label.new(nil, title, color)
  end
end
