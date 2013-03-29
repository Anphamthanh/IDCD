class ApplicationController < ActionController::Base
	protect_from_forgery

	def set_current_semester
		session[:current_semester] = Semester.find(params[:selected_semester])
		redirect_to request.referer
	end
end
