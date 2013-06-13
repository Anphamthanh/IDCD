class GroupMember < ActiveRecord::Base
  attr_accessible :group_id, :invited, :member, :requested, :student_id

  belongs_to :group
  belongs_to :student

  validates :group_id, :uniqueness => { :scope => [:student_id, :requested, :invited, :member], :message => "Duplicate records!" }
end
