class PastProject < ActiveRecord::Base
  mount_uploader :picture1, PictureUploader
    mount_uploader :picture2, PictureUploader

  mount_uploader :picture3, PictureUploader

  mount_uploader :picture4, PictureUploader


  attr_accessible :description1, :description2, :description3, :description4, :links, :picture1, :picture2, :picture3, :picture4, :title1, :title2, :title3, :title4
end
