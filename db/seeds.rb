# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Stuff that needs to set up by an admin
Semester.create(:name => "Spring 2013", :start_date => Time.local(2013, 1, 10), :end_date => Time.local(2013, 5, 2))


# Examples and demos
Page.create(:name => "Home")
Page.create(:name => "Expo")
Page.create(:name => "Industry")

College.create(:name => "ECE")
College.create(:name => "ID")
College.create(:name => "ME")
College.create(:name => "BME")

Company.create(:name => "Boeing", :technical_name => "Survy")
Project.create(:name => "Jet Packs", :background => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum sodales lacus, vitae dictum massa cursus vitae. Fusce porttitor nulla non velit porta mattis.", status_id: 1, :company_id => 1)
PastProject.create(:title => "NASA Space Trains", :description => "Coming soon")


# Stuff that will not change without a significant code impact
ProjectStatusType.create(:name => "Incomplete")
ProjectStatusType.create(:name => "Submitted")
ProjectStatusType.create(:name => "Accepted")
ProjectStatusType.create(:name => "Rejected")


