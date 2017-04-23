class Guest
  
  attr_reader :name, :is_in_a_group, :group_id, :bill

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

end