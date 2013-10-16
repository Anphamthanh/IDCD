class User < ActiveRecord::Base
  attr_accessible :admin, :email, :firstname, :gtusername, :lastname, :type, :test, :school_id, :section_id

  def updateSection(params)
    semester_id = params[:semester][:id]
    section_id = params[:section_id]["for_semester_#{semester_id}"]
    self.section_id = section_id
  end

  def semester
    self.section.semester
  end

  def name
    if firstname.blank?
      return gtusername
    else
      return "#{firstname} #{lastname}"
    end
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
