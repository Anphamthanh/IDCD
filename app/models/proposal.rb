class Proposal < ActiveRecord::Base
  attr_accessible :group_id, :project_id, :propsal_status_type_id
  belongs_to :propsal_status_type
  belongs_to :project
  belongs_to :group
  
end
