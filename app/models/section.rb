class Section < ActiveRecord::Base
  attr_accessible :name, :semester_id, :college_id

  belongs_to :semester
  belongs_to :college
end