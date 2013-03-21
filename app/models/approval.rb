class Approval < ActiveRecord::Base
  attr_accessible :faculty_id, :project_id

  belongs_to :faculty
  belongs_to :project
end
