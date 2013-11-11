# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Stuff that needs to set up by an admin
Semester.create(:name => "Just Browsing", :start_date => Time.local(2000, 1, 1), :end_date => Time.local(2050, 1, 1))
Section.create(name: "Just Browsing", semester_id: 1)

Semester.create(:name => "Fall 2013", :start_date => Time.local(2013, 8, 10), :end_date => Time.local(2013, 12, 22))

# ADMIN 
User.create(gtusername: "svaish3", admin: true)
User.create(gtusername: "ajariwala3", admin: true)
User.create(gtusername: "mtrinquero3", admin: true)


# Stuff that will not change without a significant code impact
# 
# Incomplete and Submitted projects are not associated with a semester.
# Only when a project is Accepted by an Admin is it assigned a semester.

ProjectStatus.create(:name => "Incomplete")
ProjectStatus.create(:name => "Completed")
ProjectStatus.create(:name => "Accepted")
ProjectStatus.create(:name => "Rejected")

School.create(:name => "ECE")
School.create(:name => "ID")
School.create(:name => "ME")
School.create(:name => "BME")
School.create(:name => "ISyE")
School.create(:name => "MSE")
School.create(:name => "AE")
School.create(:name => "COC")


