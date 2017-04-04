# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Link.delete_all
Link.create(url: "https://www.google.com", title: "Google")
Link.create(url: "https://www.nerd-bay.herokuapp.com", title: "Nerd Bay")
Link.create(url: "https://www.espn.com", title: "ESPN")
Link.create(url: "https://www.reddit.com", title: "Reddit")
