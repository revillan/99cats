# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Cat.create!(birth_date: "1990/01/20", color: "ochre", name: "Pickles", sex: "M", description: "My third favorite cat")
Cat.create!(birth_date: "1999/01/20", color: "purple", name: "Snickers", sex: "M", description: "My first favorite cat")
Cat.create!(birth_date: "1995/06/25", color: "polka-dot", name: "Lemon", sex: "F", description: "My second favorite cat")

CatRental.create!(cat_id: 1, status: "APPROVED", start_date: "2016/1/20", end_date: "2016/1/25")
CatRental.create!(cat_id: 1, status: "PENDING", start_date: "2016/1/23", end_date: "2016/1/27")
CatRental.create!(cat_id: 1, status: "APPROVED", start_date: "2016/2/20", end_date: "2016/2/25")
