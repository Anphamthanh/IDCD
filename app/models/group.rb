class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :group_members, :dependent => :destroy
  has_many :students, :through => :group_members
  has_many :proposals, :dependent => :destroy

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
