class ProjectStatusType < ActiveRecord::Base
  attr_accessible :name

  has_many :project_statuses
end
