class School < ActiveRecord::Base
  attr_accessible :name

  has_many :project_schools
  has_many :projects, :through => :project_schools

end
