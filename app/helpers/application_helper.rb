module ApplicationHelper

  def user_present
    if current_student or current_faculty or current_admin
      return true
    else
      return false
    end
  end

  def type_of_user
    if current_student
      return "student"
    elsif current_admin
      return "admin"
    elsif current_faculty
      return "faculty"
    else
      return "no_user"
    end
  end

end
