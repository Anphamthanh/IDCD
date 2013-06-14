class Proposal < ActiveRecord::Base
  attr_accessible :description, :group_id, :project_id

  belongs_to :group
  belongs_to :project
  
end
