class ProjectStatus < ActiveRecord::Base
  attr_accessible :project_id, :project_status_type_id, :semester_id

  belongs_to :project
  belongs_to :project_status_type
  belongs_to :semester

  def incomplete!
    self.project_status_type_id = 1
  end

  def complete!
    self.project_status_type_id = 2
  end

  def accepted!
    self.project_status_type_id = 3
  end

  def rejected!
    self.project_status_type_id = 4
  end
end
