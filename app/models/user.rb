class User < ActiveRecord::Base
  attr_accessible :admin, :email, :firstname, :gtusername, :lastname, :type, :test

  def name
    return "#{firstname} #{lastname}"
  end

  def isAdmin?
    if self.admin 
      return true
    else
      return false
    end
  end

end
