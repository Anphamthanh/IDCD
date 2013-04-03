class Text < ActiveRecord::Base
  attr_accessible :description
  belongs_to :page

end
