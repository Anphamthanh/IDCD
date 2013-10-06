class HomeController < ApplicationController

  skip_before_filter :require_login, :only => [:login_with_CAS, :index]
  before_filter RubyCAS::Filter, :only => [:login_with_CAS]

  def login_with_CAS
    if User.find_by_gtusername(session[:cas_user]).nil?
      flash[:notice] = "Please complete the one-time registration. Do not leave any field blank."
      redirect_to new_user_path

      return
    elsif current_user.incompleteProfile?
      flash[:error] = "Please complete all fields in your profile."
      redirect_to edit_student_path(current_user)
      return
    end

    respond_to do |format|
      format.html { redirect_to :controller => 'projects', :action => 'index' }
      format.json { render json: @events }
    end
  end

  def logout
    RubyCAS::Filter.logout(self, "http://google.com")
    reset_session
    return
  end

  def index
  end



end
