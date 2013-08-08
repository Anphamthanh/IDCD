class Proposal < ActiveRecord::Base
  attr_accessible :description, :group_id, :project_id, :decision

  belongs_to :group
  belongs_to :project

  validates :group_id, :uniqueness => { :scope => [:project_id], :message => "Duplicate records!" }


  def accept!
    self.decision = 1
  end

  def reject!
    self.decision = -1
  end

  def pending!
    self.decision = 0
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
