class GroupProposal < ActiveRecord::Base
  attr_accessible :group_id, :proposal_id
  belongs_to :group
  belongs_to :student
end
