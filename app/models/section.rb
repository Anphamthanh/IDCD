class Section < ActiveRecord::Base
  attr_accessible :name, :semester_id, :school_id

  belongs_to :semester
  belongs_to :school

  has_many :faculty_sections
  has_many :faculties, :through => :faculty_sections
  has_many :students

  def groups
    list_of_groups = []

    # for each student in this section
    self.students.each do |student|

      # if the student has a group
      if student.is_owner?
        if !list_of_groups.include? student.my_group
          list_of_groups << student.my_group
        end
      end

    end
    return list_of_groups
  end

  def students_without_groups
    list_of_students = []

    # for each student in this section
    self.students.each do |student|

      # if the student does not have a group
      if !student.is_owner?
        list_of_students << student
      end

    end
    return list_of_students
  end

  def faculty_approved_projects(semester_id)
    projects = []
    self.faculties.each do |faculty|
      projects = projects | faculty.approved_projects(semester_id)
    end
    return projects
  end

end
