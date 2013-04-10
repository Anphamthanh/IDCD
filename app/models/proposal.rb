class Proposal < ActiveRecord::Base
  attr_accessible :group_id, :project_id, :propsal_status_type_id
  belongs_to :propsal_status_type
  belongs_to :project
  has_one :group_proposal
  has_one :group, :through => :group_proposal
end
