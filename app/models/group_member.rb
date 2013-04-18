class GroupMember < ActiveRecord::Base
  attr_accessible :group_id, :student_id, :name, :email
  belongs_to :group
  belongs_to :student
end
