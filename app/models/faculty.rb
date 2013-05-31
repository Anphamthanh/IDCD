class Faculty < User

  has_many :faculty_sections
  has_many :sections, :through => :faculty_sections
  has_many :faculty_project_decisions
  has_many :projects, :through => :faculty_project_decisions
  has_many :approved_projects, :through => :faculty_project_decisions, :source => :project, :conditions => "decision = true"
  has_many :rejected_projects, :through => :faculty_project_decisions, :source => :project, :conditions => "decision = false"
  
  belongs_to :school

end
