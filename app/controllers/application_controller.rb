class ApplicationController < ActionController::Base
  #include ApplicationHelper

  protect_from_forgery

  before_filter :create_all_faculty_project_relations
  #before_filter :check_current_user_profile_completeness

  #def check_current_user_profile_completeness
  #  if current_user and (current_user.email.nil?)
  #    redirect_to edit_user_path(current_user)
  #  end
  #end

  def create_all_faculty_project_relations
    Faculty.all.each do |f|
      f.projects << Project.all - f.projects
    end
  end

  def set_current_semester
    session[:current_semester] = Semester.find(params[:selected_semester])
    redirect_to request.referer
  end
end
