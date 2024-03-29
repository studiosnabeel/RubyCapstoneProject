require_relative 'item'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title:, color:, id: Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item=(item)
    @items.push(item) unless @items.include?(item)
    item.label = self
  end
end
