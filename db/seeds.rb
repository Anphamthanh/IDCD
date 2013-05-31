# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Stuff that needs to set up by an admin
Semester.create(:name => "Fall 2013", :start_date => Time.local(2013, 8, 10), :end_date => Time.local(2013, 12, 22))


# Examples and demos
School.create(:name => "ECE")
School.create(:name => "ID")
School.create(:name => "ME")
School.create(:name => "BME")

Company.create(name: "Boeing", technical_name: "string", technical_designation: "string", technical_email: "string", technical_phone: "string", director_name: "string", director_designation: "string", director_email: "string", director_phone: "string")

Project.create(name: "ECE Project (to be rejected)", background: "background", concept: "concept", design: "design", skills: "skills", solutions: "solutions", company_id: 1, project_status_id: 2)
Project.create(name: "ECE Project", background: "background", concept: "concept", design: "design", skills: "skills", solutions: "solutions", company_id: 1, project_status_id: 2)
Project.create(name: "ID and ECE Project", background: "background", concept: "concept", design: "design", skills: "skills", solutions: "solutions", company_id: 1, project_status_id: 1)

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




