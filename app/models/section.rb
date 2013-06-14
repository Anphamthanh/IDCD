class Section < ActiveRecord::Base
  attr_accessible :name, :semester_id, :school_id

  belongs_to :semester
  belongs_to :school

  has_many :faculty_sections
  has_many :faculties, :through => :faculty_sections

  def faculty_approved_projects
    projects = []
    self.faculties.each do |faculty|
      projects = projects | faculty.approved_projects
    end
    return projects
  end

end
