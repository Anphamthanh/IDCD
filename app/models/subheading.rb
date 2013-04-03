class Subheading < ActiveRecord::Base
  attr_accessible :title
  belongs_to :page

end
