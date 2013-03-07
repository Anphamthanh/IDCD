class Section < ActiveRecord::Base
  attr_accessible :name, :semester_id

  belongs_to :semester
end
