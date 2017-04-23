class Menu

  attr_reader :name, :items
  attr_accessor :message

  def initialize(a_name)
    @name = a_name
    @message = ""
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

  def pretty_print
    divider = "=" * @message.size()
    puts divider
    puts "#{@message}"
    puts divider
    @items.each_with_index do |item, index|
      puts "#{index + 1}.- #{item}"
    end
    puts divider
  end
  





end