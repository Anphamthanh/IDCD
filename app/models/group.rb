class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :group_members, :dependent => :destroy
  has_many :students, :through => :group_members
  has_many :proposals, :dependent => :destroy

  def available_project_choices
    available_projects = Project.all
    self.students.each do |student|
      available_projects = available_projects & student.section.faculty_approved_projects
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
