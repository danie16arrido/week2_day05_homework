class Guest
  
  attr_reader :name, :items_consumed, :pretty_bill 
  attr_accessor :is_in_a_group, :group_id, :bill, :favourite_song

  def initialize(a_name)
    @name = a_name
    @is_in_a_group = false
    @group_id = 0
    @bill = 0
    @favourite_song = ""
    @items_consumed = []
  end

 def set_guest_group
   @is_in_a_group = true
 end

 def unset_guest_group
   @is_in_a_group = false
 end

 def add_to_group_id(id)
   @group_id = id
 end 

 def charge_for(item)
  if item.class == Integer
    @bill += item
  elsif item.class == Array
    @bill += item[1]
    @items_consumed << item[0].to_s
  end
 end

 def pretty_bill
  divider ="=" * 25
  puts divider
  puts "Thanks #{@name}\nDetail:"
  puts divider

  bill = Hash.new(0)
  @items_consumed.each do |v|
    bill[v] += 1
  end
  bill.each do |k, v|
    puts "#{v} \t #{k}(s)"
  end
  puts "Total: £ #{@bill.round(2)}"
  puts divider
 end

end