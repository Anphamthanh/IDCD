class FacultyProjectDecision < ActiveRecord::Base
  attr_accessible :faculty_id, :project_id

  belongs_to :faculty
  belongs_to :project

  def stringify
    if self.decision
      return "Approved"
    else
      return "Rejected"
    end
  end

end
