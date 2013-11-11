class Proposal < ActiveRecord::Base
  attr_accessible :description, :group_id, :project_id, :decision, :priority

  belongs_to :group
  belongs_to :project

  validates :group_id, :uniqueness => { :scope => [:project_id], :message => "Duplicate records!" }

  def insert_at_priority(current_proposal_priority, time_order = "DESC")
    proposals = Proposal.where("group_id = #{self.group_id}").order("priority ASC", "updated_at #{time_order}")
    priority_index = 1

    proposals.each do |p|
      p.priority = priority_index
      p.save
      priority_index = priority_index + 1
    end

  end

  def acceptThisRejectOthers!
  #reject all other proposals from that same group, then accept only one proposal  
    other_proposals = Proposal.where("group_id = #{self.group_id}")
    other_proposals.each do |p|
      p.reject!
      p.save!
    end
    self.decision = 1
    self.save!
  end

  def markAllPending!
    #mark all proposals from a group as peding if their accepted project is marked as pending
    all_proposals = Proposal.where("group_id = #{self.group_id}")
    all_proposals.each do |p|
      p.pending!
      p.save!
    end
  end
  
  def accept!
    self.decision = 1
    self.save!
  end

  def reject!
    self.decision = -1
    self.save!
  end

  def pending!
    self.decision = 0
    self.save!
  end

  def status
    if self.decision == 1
      return "Accepted"
    elsif self.decision == 0
      return "Pending"
    elsif self.decision == -1
      return "Rejected"
    end
  end


  def self.pending
    Proposal.where(decision: 0).order("project_id, group_id")
  end
  
  def self.accepted
    Proposal.where(decision: 1).order("project_id, group_id")
  end
  
  def self.rejected
    Proposal.where(decision: -1).order("project_id, group_id")
  end
  
end
