class Page < ActiveRecord::Base
  attr_accessible :name 
  has_many :page_items
end
