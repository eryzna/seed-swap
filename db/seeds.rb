# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
    ["Andy", "Fierro", "afierro", 90057, "password"],
    ["Emily", "Ryznar", "emryz", 90403, "password"],
    ["Eve", "Ryznar", "eryzna", 48167, "password"],
    ["James", "Evans", "jevans", 90403, "password"],
    ["Gustav", "Mousehunter", "gurustav", 60703, "password"]

]

user_list.each do |first_name, last_name, username, zip_code, password|
    User.create(first_name: first_name, last_name: last_name, username: username, zip_code: zip_code, password: password)
end

seed_list = [
    ["Tomatoes", "Vegetable"],
    ["Arugula", "Vegetable"],
    ["Chives", "Herb"],
    ["Basil", "Herb"],
    ["Poppies", "Flower"],
    ["Cilantro", "Herb"],
    ["Grapefruit", "Fruit"]
    
]

seed_list.each do |name, category|
    Seed.create(name: name, category: category)
end



  
