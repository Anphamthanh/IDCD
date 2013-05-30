class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :create_all_faculty_project_relations

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
