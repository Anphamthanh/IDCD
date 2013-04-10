class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :group_members
  has_many :students, :through => :group_members
  has_many :group_proposals
  has_many :proposals, :through => :group_proposals, :source => :group_proposals
end
