class Guest
  
  attr_reader :name, :bill
  attr_accessor :is_in_a_group, :group_id
  
  def initialize(a_name)
    @name = a_name
    @is_in_a_group = false
    @group_id = 0
    @bill = 0
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
  @bill += item
 end

end