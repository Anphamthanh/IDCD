class PastProject < ActiveRecord::Base
  attr_accessible :description, :picture, :title
  
  mount_uploader :picture, PictureUploader
end
