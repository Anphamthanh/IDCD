class Project < ActiveRecord::Base
  attr_accessible :background, :concept, :design, :name, :skills, :solutions, :nda_required, :funding_commitment, :company_id, :form, :status_id

  belongs_to :company

  mount_uploader :form, ProjectFormUploader

  def incomplete?
    return true if status_id == 1
    return false
  end

end
