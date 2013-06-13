class Student < User

  belongs_to :section

  has_many :group_members # not group members in the literal sense
  has_many :groups, :through => :group_members

  def my_groups_requests
    return self.group_member_of.requesters
  end

  def group_member_of
    self.group_members.each do |row|
      if row.member
        return Group.find(row.group_id)
      end
    end
    return nil
  end

  def requests_to_join_groups
    groups = []
    self.group_members.each do |group_member|
      if group_member.requested
        groups << Group.find(group_member.group_id)
      end
    end

    if groups.count > 0
      return groups
    end
    return false
  end

end
