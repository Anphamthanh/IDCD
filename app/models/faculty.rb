class Faculty < User

  has_many :faculty_sections
  has_many :sections, :through => :faculty_sections
  has_many :faculty_project_decisions
  has_many :projects, :through => :faculty_project_decisions

end
