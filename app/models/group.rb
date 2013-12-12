class Group < ActiveRecord::Base
  attr_accessible :name, :semester_id

  has_many :group_members, :dependent => :destroy
  has_many :students, :through => :group_members
  has_many :proposals, :dependent => :destroy
  belongs_to :semester
  
  def assigned_project
    self.proposals.each do |proposal|
      if Proposal.accepted.include? proposal
        return proposal.project
      end
    end
    return false
  end

  #displays available projects for group members avioding duplicates
  def available_project_choices(semester_id)
    available_projects = []
    self.students.each do |student|
      available_projects = available_projects | student.section.faculty_approved_projects(semester_id)
    end
    return available_projects
  end

  def owners
    students = []
    self.group_members.each do |gm|
      if gm.member 
        students << Student.find(gm.student_id)
      end
    end
    return students
  end

  def requests
    students = []
    self.group_members.each do |gm|
      if gm.requested
        students << Student.find(gm.student_id)
      end
    end
    return students
  end

  def invites
    students = []
    self.group_members.each do |gm|
      if gm.invited
        students << Student.find(gm.student_id)
      end
    end
    return students
  end

end
