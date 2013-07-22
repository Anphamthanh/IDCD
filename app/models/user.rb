class User < ActiveRecord::Base
  attr_accessible :admin, :email, :firstname, :gtusername, :lastname, :type, :test, :school_id, :section_id

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

  def isTest?
    return self.test
  end

  def incompleteProfile?
    if self.email.blank? or 
      self.firstname.blank? or 
      self.lastname.blank? or
      self.gtusername.blank?
      return true
    else
      return false
    end
  end

end
