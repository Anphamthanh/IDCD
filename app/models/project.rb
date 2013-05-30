class Project < ActiveRecord::Base
  attr_accessible :background, :concept, :design, :name, :skills, :solutions, :nda_required, :funding_commitment, :company_id, :form, :semester_id, :project_status_id

  belongs_to :company
  belongs_to :semester
  belongs_to :project_status

  has_many :faculty_project_decisions
  has_many :faculties, :through => :faculty_project_decisions
  has_many :project_schools
  has_many :schools, :through => :project_schools

  #has_many :proposals
  #has_many :approving_faculty, :through => :approvals, :source => "faculty"

  mount_uploader :form, ProjectFormUploader

  def does_faculty_approve(test_faculty)
		if approving_faculty.include? test_faculty
			return true
		else
			return false
		end
  end

  def semester
    return Semester.find(self.semester_id)
  end

  def accepted?
    return true if project_status.project_status_type_id == 3
    return false
  end



  def rejected?
    return true if self.project_status_id == ProjectStatus.find_by_name("Rejected").id
    return false
  end

  def reject!
    self.project_status_id = ProjectStatus.find_by_name("Rejected").id
  end



  def incomplete?
    return true if self.project_status_id == ProjectStatus.find_by_name("Incomplete").id
    return false
  end

  def incomplete!
    self.project_status_id = ProjectStatus.find_by_name("Incomplete").id
  end



  def completed?
    return true if self.project_status_id == ProjectStatus.find_by_name("Completed").id
    return false
  end

  def complete!
    self.project_status_id = ProjectStatus.find_by_name("Completed").id
  end

end
