# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Seed.destroy_all
Swap.destroy_all

user_list = [
    ["Andy", "Fierro", "afierro", 90057, "password"],
    ["Emily", "Ryznar", "emryz", 90403, "password"],
    ["Eve", "Ryznar", "eryzna", 48167, "password"],
    ["James", "Evans", "jevans", 90403, "password"],
    ["Gustav", "Mousehunter", "gurustav", 60703, "password"],
    ["Brian", "Lim", "blim", 90004, "password"],
    ["Princess", "Dog", "princess", 90057, "password"],
    ["Fred", "Fierro", "afierro", 90057, "password"],
    ["Madeline", "Zacha", "emryz", 90403, "password"],
    ["Paul", "Ryznar", "eryzna", 48167, "password"],
    ["Joanne", "Reilly", "jevans", 90403, "password"],
    ["Lily", "Mousehunter", "gurustav", 60703, "password"],
    ["Sharon", "Tran", "blim", 90004, "password"],
    ["Toffee", "Cat", "princess", 90057, "password"]

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

swap_list = [
    ["Tomatoes!!", 1, 1],
    ["Arugula anyone?", 2, 2],
    ["Chives to swap!", 3, 3],
    ["Basil Seeds Available", 4, 4],
    ["Beautiful Poppy Seeds!", 5, 5],
    ["Cilantrooo", 6, 6],
    ["Grapefruit", 7, 7],
    ["Arugula anyone?", 1, 2],
    ["Arugula anyone?", 3, 2],
    ["Cilantro!", 2, 6],
    ["Tomatoes!!", 5, 1],
    ["Arugula anyone?", 6, 2],
    ["Chives to swap!", 7, 3],
    ["Basil Seeds Available", 7, 4],
    ["Beautiful Poppy Seeds!", 6, 5],
    ["Cilantrooo", 5, 6],
    ["Grapefruit", 4, 7],
    ["Arugula anyone?", 3, 2],
    ["Arugula anyone?", 2, 2],
    ["Cilantro!", 1, 6],
    ["Arugula anyone?", 8, 2],
    ["Arugula anyone?", 9, 2],
    ["Cilantro!", 10, 6],
    ["Tomatoes!!", 11, 1],
    ["Arugula anyone?", 12, 2],
    ["Chives to swap!", 13, 3],
    ["Basil Seeds Available", 14, 4],
    ["Beautiful Poppy Seeds!", 8, 5],
    ["Cilantrooo", 9, 6],
    ["Grapefruit", 10, 7],
    ["Arugula anyone?", 11, 2],
    ["Arugula anyone?", 12, 2],
    ["Cilantro!", 13, 6],
    ["Grapefruit", 10, 7]
]

swap_list.each do |title, user_id, seed_id|
    Swap.create(title: title, user_id: user_id, seed_id: seed_id)
end




  
