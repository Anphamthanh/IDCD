class Student < User

  belongs_to :section

  has_many :group_members # not group members in the literal sense
  has_many :groups, :through => :group_members

  def my_group
    self.group_members.each do |gm|
      if gm.member
        return Group.find(gm.group_id)
      end
    end
    return nil
  end

  def is_owner?
    return !self.my_group.nil?
  end

  def my_requests
    groups = []
    self.group_members.each do |group_member|
      if group_member.requested
        groups << Group.find(group_member.group_id)
      end
    end

    return groups
  end

  def my_invites
    groups = []
    self.group_members.each do |group_member|
      if group_member.invited
        groups << Group.find(group_member.group_id)
      end
    end

    return groups
  end

  def my_groups_requests
    return self.my_group.requests
  end

  def my_groups_invites
    return self.my_group.invites
  end

end
