class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :group_members
  has_many :students, :through => :group_members
  has_many :proposals
end
