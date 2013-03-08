class Faculty < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body


  # find sections the faculty has been assigned to for the semester being passed
  def assigned_sections_for_semester(semester)
    assigned_sections = []
    semester.sections.each do |section|
      temp = FacultySection.where("faculty_id = ? AND section_id = ?", id, section.id)
      assigned_sections.append(temp) if temp.count != 0
    end
    return assigned_sections
  end

end
