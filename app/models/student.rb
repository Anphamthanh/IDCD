class Student < User

  belongs_to :section

  has_many :group_members # not group members in the literal sense
  has_many :groups, :through => :group_members

  def group_member_of
    self.group_members.each do |row|
      if row.member
        return Group.find(row.group_id)
      end
    end
    return nil
  end

end
