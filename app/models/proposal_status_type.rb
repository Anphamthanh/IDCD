class ProposalStatusType < ActiveRecord::Base
  attr_accessible :name

    has_many :proposal_statuses

end
