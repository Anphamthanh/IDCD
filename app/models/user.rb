class User < ActiveRecord::Base
  attr_accessible :admin, :email, :firstname, :gtusername, :lastname
end
