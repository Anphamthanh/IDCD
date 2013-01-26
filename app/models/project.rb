class Project < ActiveRecord::Base
  attr_accessible :background, :concept, :design, :name, :skills, :solutions
end
