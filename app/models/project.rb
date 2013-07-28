class Project < ActiveRecord::Base
  attr_accessible :background, :concept, :design, :name, :skills, :solutions, :nda_required, :funding_commitment, :company_id, :form, :semester_id, :project_status_id, :submitter_id

  belongs_to :company
  belongs_to :semester
  belongs_to :project_status
  belongs_to :submitter, class_name: "User"

  has_many :faculty_project_decisions
  has_many :faculties, :through => :faculty_project_decisions
  has_many :project_schools
  has_many :schools, :through => :project_schools
  has_many :proposals

  #has_many :proposals
  #has_many :approving_faculty, :through => :approvals, :source => "faculty"

  mount_uploader :form, ProjectFormUploader

  def faculty_decision(f)
    return FacultyProjectDecision.where(faculty_id: f.id, project_id: self.id).first

    d = FacultyProjectDecision.where(faculty_id: f.id, project_id: self.id).first.decision
    if d
      return "Accepted"
    else
      return "Rejected"
    end
  end

  def accepted?
    return true if self.project_status_id == ProjectStatus.find_by_name("Accepted").id
    return false
  end
  def accept!
    self.project_status_id = ProjectStatus.find_by_name("Accepted").id
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
