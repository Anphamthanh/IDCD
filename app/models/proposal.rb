class Proposal < ActiveRecord::Base
  attr_accessible :description, :group_id, :project_id
end
