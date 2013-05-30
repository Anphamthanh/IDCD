class User < ActiveRecord::Base
  attr_accessible :admin, :email, :firstname, :gtusername, :lastname, :type, :test

  def name
    return "#{firstname} #{lastname}"
  end

  def isAdmin?
    return true if self.admin 
    return false
  end

  def isFaculty?
    return true if self.type == "Faculty"
    return false
  end

  def isStudent?
    return true if self.type == "Student"
    return false
  end

end
