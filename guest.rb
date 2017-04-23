class Guest
  
  attr_reader :name, :items_consumed 
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

end