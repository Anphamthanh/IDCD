class FacultySection < ActiveRecord::Base
  attr_accessible :faculty_id, :section_id

  belongs_to :faculty
  belongs_to :section
end 

