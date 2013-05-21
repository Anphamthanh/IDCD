class Semester < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date

  has_many :sections
  has_many :projects

  def self.active
	  where("end_date >= ?", Date.current)
  end

end
