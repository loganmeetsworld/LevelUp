# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tags = [
  { name: "HTML/CSS" },
  { name: "Ruby" },
  { name: "Rails" }
]

tags.each do |t|
  Tag.create(t)
end

resources = [
  { name: "CodeAcademy", link: "http://www.codecademy.com/", description: "Great resource for lots of things!", comments: "None", status: 1 },
  { name: "Bento", link: "https://www.bento.io/", description: "Bento grid with lots of activities", comments: "None", status: 1 },
  { name: "Ruby Warrior", link: "https://www.bloc.io/ruby-warrior#/", description: "Play games while honing your Ruby logic", comments: "None", status: 1 }
]

resources.each do |r|
  Resource.create(r)
end

lists = [
  { name: "In process" },
  { name: "Internship Prep" },
  { name: "Completed" }
]

lists.each do |l|
  List.create(l)
end
