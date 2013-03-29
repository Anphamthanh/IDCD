class Section < ActiveRecord::Base
  attr_accessible :name, :semester_id, :school_id

  belongs_to :semester
  belongs_to :school

  has_many :faculty_sections
  has_many :faculties, :through => :faculty_sections

  #TODO maybe can be done using :throughs
  def projects
    school.projects
  end
end
