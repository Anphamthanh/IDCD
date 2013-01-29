# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Semester.create(:name => "Spring 2013", :start => Time.local(2013, 1, 10), :end => Time.local(2013, 5, 2))
Company.create(:name => "Boeing", :technical_name => "Survy")
Project.create(:name => "Jet Packs")
Home.create(:picture =>"/uploads/home/picture/1/CapstoneLogo.png", :title => "Fall 2013 GT 4983", :description => "Coming soon");
