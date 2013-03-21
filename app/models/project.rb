class Project < ActiveRecord::Base
  attr_accessible :background, :concept, :design, :name, :skills, :solutions, :nda_required, :funding_commitment, :company_id, :form, :status_id

  belongs_to :company
  has_many :approvals
  has_many :approving_faculty, :through => :approvals, :source => "faculty"

  mount_uploader :form, ProjectFormUploader

  def incomplete?
    return true if status_id == 1
    return false
  end

  def accepted?
    return true if status_id == 3
    return false
  end

end
