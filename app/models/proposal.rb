class Proposal < ActiveRecord::Base
  attr_accessible :description, :group_id, :project_id

  belongs_to :group
  belongs_to :project

  validates :group_id, :uniqueness => { :scope => [:project_id], :message => "Duplicate records!" }
  
end
