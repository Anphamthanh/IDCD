class Faculty < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me
	# attr_accessible :title, :body

	has_many :faculty_sections
	has_many :sections, :through => :faculty_sections
	has_many :approvals
	has_many :approved_projects, :through => :approvals, :source => "project"

	# find sections the faculty has been assigned to for the semester being passed
	def assigned_projects_for_semester(semester)
		assigned_projects = []
		sections.each do |section|
			assigned_projects.append(section.projects) if section.projects.count != 0
		end

		return assigned_projects.flatten(1).uniq
	end

end
