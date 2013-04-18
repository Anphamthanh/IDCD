class Proposal < ActiveRecord::Base
  attr_accessible :group_id, :project_id, :propsal_status_type_id
  belongs_to :propsal_status_type
  belongs_to :project
  belongs_to :group


  def pending?
    return true if proposal_status.proposal_status_type_id == 1
    return false
  end

  def accepted?
    return true if proposal_status.proposal_status_type_id == 2
    return false
  end

  def rejected?
    return true if proposal_status.proposal_status_type_id == 3
    return false
  end
  
end
