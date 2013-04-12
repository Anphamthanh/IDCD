class ProposalStatus < ActiveRecord::Base
  attr_accessible :group_id, :proposal_id, :proposal_status_type_id
end
