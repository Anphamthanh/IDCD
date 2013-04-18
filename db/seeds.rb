# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Stuff that needs to set up by an admin
Semester.create(:name => "Spring 2013", :start_date => Time.local(2013, 1, 10), :end_date => Time.local(2013, 5, 2))
Semester.create(:name => "Fall 2012", :start_date => Time.local(2012, 8, 10), :end_date => Time.local(2012, 12, 22))
Semester.create(:name => "Fall 2013", :start_date => Time.local(2013, 8, 10), :end_date => Time.local(2013, 12, 22))


# Examples and demos
Page.create(:name => "Home")
Page.create(:name => "Expo")
Page.create(:name => "Industry")

School.create(:name => "ECE")
School.create(:name => "ID")
School.create(:name => "ME")
School.create(:name => "BME")

Company.create(:name => "Boeing", :technical_name => "Survy")
Project.create(:name => "Jet Packs", :background => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum sodales lacus, vitae dictum massa cursus vitae. Fusce porttitor nulla non velit porta mattis.", :company_id => 1)
ProjectStatus.create(:project_id => 1, :project_status_type_id => 1)
PastProject.create(:title => "NASA Space Trains", :description => "Coming soon")


# Stuff that will not change without a significant code impact
# 
# Incomplete and Submitted projects are not associated with a semester.
# Only when a project is Accepted by an Admin is it assigned a semester.
ProjectStatusType.create(:name => "Incomplete")
ProjectStatusType.create(:name => "Completed")
ProjectStatusType.create(:name => "Accepted")
ProjectStatusType.create(:name => "Rejected")

ProposalStatusType.create(:name => "Pending")
ProposalStatusType.create(:name => "Accepted")
ProposalStatusType.create(:name => "Rejected")




