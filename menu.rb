class Menu

  attr_reader :name, :items

  def initialize(a_name)
    @name = a_name
    @items = []
  end

  def add_item(item)
    if item.class == Array
      item.each do |item|
        @items << item
      end
    else
      @items << item
    end

  end
end