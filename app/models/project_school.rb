class ProjectSchool < ActiveRecord::Base
  attr_accessible :project_id, :school_id

  belongs_to :project
  belongs_to :school

end
