class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :group_members
  has_many :students, :through => :group_members

  def requesters
    students = []
    GroupMember.where( group_id: self.id, requested: true).each do |group_member|
      students << Student.find(group_member.student_id)
    end

    if students.count > 0
      return students
    end
    return false
  end

end
