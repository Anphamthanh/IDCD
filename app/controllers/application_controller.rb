class ApplicationController < ActionController::Base
  #include ApplicationHelper

  protect_from_forgery

  before_filter :create_all_faculty_project_relations
  before_filter :require_login

  #before_filter :check_current_user_profile_completeness

  #def check_current_user_profile_completeness
  #  if current_user and (current_user.email.nil?)
  #    redirect_to edit_user_path(current_user)
  #  end
  #end

  helper_method :current_user
  def current_user
    if session[:test_user]
      return test_user
    end

    if session[:cas_user]
      return User.find_by_gtusername(session[:cas_user])
    else
      return false
    end
  end


  helper_method :test_user
  def test_user
    if session[:test_user]
      return User.find_by_gtusername(session[:test_user])
    else
      return false
    end
  end


  def require_login
    if not current_user
      redirect_to home_path
    elsif current_user.incompleteProfile?
      flash[:error] = "Please complete the one-time registration. Do not leave any field blank."
      redirect_to edit_user_path(current_user)
    end
  end


  def create_all_faculty_project_relations
    Faculty.all.each do |f|
      f.projects << Project.all - f.projects
    end
  end


  def set_current_semester
    session[:current_semester] = Semester.find(params[:selected_semester])
    redirect_to request.referer
  end

  #will send artive record errors to 404 page in production, logs error in render_404
  if Rails.env.production?
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render_404
    end
  end

  def render_404
    respond_to do |format|
      #logger message ... add additional informaiton?
      Rails.logger.info "Rails 404 Redirect - RecordNotFound"
      format.html { render "errors/404", :status => '404 Not Found', :layout => false }
      format.xml  { render :nothing => true, :status => '404 Not Found' }
    end
    true
  end

end
