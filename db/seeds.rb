# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Stuff that needs to set up by an admin
Semester.create(:name => "Fall 2013", :start_date => Time.local(2013, 8, 10), :end_date => Time.local(2013, 12, 22))


Company.create(name: "Boeing", technical_name: "string", technical_designation: "string", technical_email: "string", technical_phone: "string", director_name: "string", director_designation: "string", director_email: "string", director_phone: "string")


# PROJECTS
Project.create(name: "ECE-ID Project", background: "background", concept: "concept", design: "design", skills: "skills", solutions: "solutions", company_id: 1, project_status_id: 2)
Project.create(name: "ME-ECE-ID Project", background: "background", concept: "concept", design: "design", skills: "skills", solutions: "solutions", company_id: 1, project_status_id: 2)
Project.create(name: "BME-ME-ID Project", background: "background", concept: "concept", design: "design", skills: "skills", solutions: "solutions", company_id: 1, project_status_id: 2)
Project.create(name: "ME-ECE Project", background: "background", concept: "concept", design: "design", skills: "skills", solutions: "solutions", company_id: 1, project_status_id: 2)

# SECTIONS
Section.create(name: "L1-ece", semester_id: 1, school_id: 1)
Section.create(name: "L2-ece", semester_id: 1, school_id: 1)
Section.create(name: "L3-id", semester_id: 1, school_id: 2)
Section.create(name: "L4-id", semester_id: 1, school_id: 2)
Section.create(name: "L5-me", semester_id: 1, school_id: 3)
Section.create(name: "L6-me", semester_id: 1, school_id: 3)
Section.create(name: "L7-bme", semester_id: 1, school_id: 4)
Section.create(name: "L8-bme", semester_id: 1, school_id: 4)

# TEST FACULTY
Faculty.create(gtusername: "fac1-ece", admin: false, test: true, school_id: 1)
Faculty.create(gtusername: "fac2-ece", admin: false, test: true, school_id: 1)
Faculty.create(gtusername: "fac3-id", admin: false, test: true, school_id: 2)
Faculty.create(gtusername: "fac4-id", admin: false, test: true, school_id: 2)
Faculty.create(gtusername: "fac5-me", admin: false, test: true, school_id: 3)
Faculty.create(gtusername: "fac6-me", admin: false, test: true, school_id: 3)
Faculty.create(gtusername: "fac7-bme", admin: false, test: true, school_id: 4)
Faculty.create(gtusername: "fac8-bme", admin: false, test: true, school_id: 4)

# TEST STUDENTS
Student.create(gtusername: "stu-1", admin: false, test: true, section_id: 2)
Student.create(gtusername: "stu-2", admin: false, test: true, section_id: 3)
Student.create(gtusername: "stu-3", admin: false, test: true, section_id: 5)
Student.create(gtusername: "stu-4", admin: false, test: true, section_id: 4)
Student.create(gtusername: "stu-5", admin: false, test: true, section_id: 1)
Student.create(gtusername: "stu-6", admin: false, test: true, section_id: 7)
Student.create(gtusername: "stu-7", admin: false, test: true, section_id: 5)
Student.create(gtusername: "stu-8", admin: false, test: true, section_id: 2)
Student.create(gtusername: "stu-9", admin: false, test: true, section_id: 5)
Student.create(gtusername: "stu-10", admin: false, test: true, section_id: 7)
Student.create(gtusername: "stu-11", admin: false, test: true, section_id: 4)

# TEST ADMIN 
User.create(gtusername: "admin", admin: true, test: true)

# FACULTY SECTIONS
FacultySection.create(faculty_id: 1, section_id: 1)
FacultySection.create(faculty_id: 3, section_id: 3)
FacultySection.create(faculty_id: 5, section_id: 5)
FacultySection.create(faculty_id: 7, section_id: 7)
FacultySection.create(faculty_id: 2, section_id: 2)
FacultySection.create(faculty_id: 4, section_id: 5)
FacultySection.create(faculty_id: 6, section_id: 6)
FacultySection.create(faculty_id: 4, section_id: 4)
FacultySection.create(faculty_id: 6, section_id: 3)
FacultySection.create(faculty_id: 8, section_id: 4)



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


