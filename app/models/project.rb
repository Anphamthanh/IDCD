class Project < ActiveRecord::Base
  attr_accessible :background, :concept, :design, :name, :skills, :solutions, :company_id

  belongs_to :company
end
