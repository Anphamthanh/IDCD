class Student < User

  belongs_to :section

  has_one :group_member
  has_one :group, :through => :group_member

end
