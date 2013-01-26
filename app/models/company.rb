class Company < ActiveRecord::Base
  attr_accessible :director_designation, :director_email, :director_name, :director_phone, :name, :semester_id, :technical_designation, :technical_email, :technical_name, :technical_phone
end
