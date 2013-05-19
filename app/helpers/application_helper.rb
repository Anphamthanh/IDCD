module ApplicationHelper

  def current_user
    if session[:cas_user]
      return User.find_by_gtusername(session[:cas_user])
    else
      return false
    end
  end

  def test_user
    if session[:test_user]
      return User.find_by_gtusername(session[:test_user])
    else
      return false
    end
  end

end
