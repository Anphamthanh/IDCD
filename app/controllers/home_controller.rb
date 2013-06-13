class HomeController < ApplicationController

  skip_before_filter :require_login, :only => [:login_with_CAS]
  before_filter RubyCAS::Filter, :only => [:login_with_CAS]

  def login_with_CAS
    if User.find_by_gtusername(session[:cas_user]).nil?
      flash[:notice] = "Welcome new user! Please fill out these details to get started"

      # create and save a new user -> default is student
      # pre-populate details received from CAS
      @user = Student.create(:gtusername => session[:cas_user])

      redirect_to edit_user_path(@user)
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


end
