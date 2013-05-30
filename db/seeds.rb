# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Stuff that needs to set up by an admin
Semester.create(:name => "Spring 2013", :start_date => Time.local(2013, 1, 10), :end_date => Time.local(2013, 5, 2))
Semester.create(:name => "Spring 2014", :start_date => Time.local(2014, 1, 10), :end_date => Time.local(2014, 5, 2))
Semester.create(:name => "Fall 2013", :start_date => Time.local(2013, 8, 10), :end_date => Time.local(2013, 12, 22))


# Examples and demos
School.create(:name => "ECE")
School.create(:name => "ID")
School.create(:name => "ME")
School.create(:name => "BME")

Company.create(:name => "Boeing", :technical_name => "Survy")
Company.create(:name => "Georgia Power", :technical_name => "John Smith")
Company.create(:name => "National Instruments", :technical_name => "Mark Jones")
Company.create(:name => "Cooper Lighting", :technical_name => "George Johnson")
Company.create(:name => "Delta Airlines Instruments", :technical_name => "Stan Brown")

Project.create(:name => "Jet Packs", :background => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum sodales lacus, vitae dictum massa cursus vitae. Fusce porttitor nulla non velit porta mattis.", :company_id => 1)
Project.create(:name => "Automatic Pulverizer Pyrite Flushing System for Units 1-3", :background => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum sodales lacus, vitae dictum massa cursus vitae. Fusce porttitor nulla non velit porta mattis.", :company_id => 2)
Project.create(:name => "Light Emitting Gate Analysis Board", :background => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum sodales lacus, vitae dictum massa cursus vitae. Fusce porttitor nulla non velit porta mattis.", :company_id => 3)
Project.create(:name => "LED Hose Down fixture", :background => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum sodales lacus, vitae dictum massa cursus vitae. Fusce porttitor nulla non velit porta mattis.", :company_id => 4)
Project.create(:name => "Prevention of aircraft damage during loading", :background => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum sodales lacus, vitae dictum massa cursus vitae. Fusce porttitor nulla non velit porta mattis.", :company_id => 5)

Group.create(:name => "Group 1")
Group.create(:name => "Group 2")
Group.create(:name => "Group 3")

# Stuff that will not change without a significant code impact
# 
# Incomplete and Submitted projects are not associated with a semester.
# Only when a project is Accepted by an Admin is it assigned a semester.
ProjectStatus.create(:name => "Incomplete")
ProjectStatus.create(:name => "Completed")
ProjectStatus.create(:name => "Accepted")
ProjectStatus.create(:name => "Rejected")

ProposalStatusType.create(:name => "Pending")
ProposalStatusType.create(:name => "Accepted")
ProposalStatusType.create(:name => "Rejected")




