class Semester < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date

  has_many :sections
  has_many :projects
  has_many :groups

  def self.active
	  where("end_date >= ?", Date.current)
  end

  def self.current
    where("end_date >= ?", Date.current).order("start_date ASC").first
  end

end
