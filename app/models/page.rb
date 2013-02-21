class Page < ActiveRecord::Base
  attr_accessible :name , :id
  has_many :page_items
end
