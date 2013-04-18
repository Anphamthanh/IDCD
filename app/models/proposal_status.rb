class ProposalStatus < ActiveRecord::Base
  attr_accessible :group_id, :proposal_id, :proposal_status_type_id

  belongs_to :proposal
  belongs_to :proposal_status_type
  belongs_to :group

  def pending!
    self.proposal_status_type_id = 1
  end

  def assigned!
    self.proposal_status_type_id = 2
  end

  def rejected!
    self.proposal_status_type_id = 3
  end

end
