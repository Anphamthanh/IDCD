class GroupMember < ActiveRecord::Base
  attr_accessible :group_id, :invited, :member, :requested, :student_id

  belongs_to :group
  belongs_to :student
end
