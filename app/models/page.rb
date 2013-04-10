class Page < ActiveRecord::Base
  attr_accessible :name , :id
  has_many :subheadings
  has_many :headings
  has_many :texts
  has_many :pictures

end
