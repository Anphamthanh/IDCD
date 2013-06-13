class Faculty < User

  has_many :faculty_sections
  has_many :sections, :through => :faculty_sections
  has_many :faculty_project_decisions
  has_many :projects, :through => :faculty_project_decisions
  #has_many :approved_projects, :through => :faculty_project_decisions, :source => :project, :conditions => "decision = true"
  #has_many :rejected_projects, :through => :faculty_project_decisions, :source => :project, :conditions => "decision = false"

  belongs_to :school

  def approved_projects
    return_list = []
    projects = self.projects.where("decision = true and project_status_id = 3")
    projects.each do |project|
      if project.schools.include? self.school
        return_list << project
      end
    end
    return return_list
  end

  def rejected_projects
    return_list = []
    projects = self.projects.where("decision = false and project_status_id = 3")
    projects.each do |project|
      if project.schools.include? self.school
        return_list << project
      end
    end
    return return_list
  end

end
