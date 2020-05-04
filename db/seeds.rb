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
    ["Gustav", "Mousehunter", "gurustav", 60703, "password"],
    ["Brian", "Lim", "blim", 90004, "password"],
    ["Princess", "Dog", "princess", 90057, "password"]

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
    ["Tomatoes!!", 3, 1, 1],
    ["Arugula anyone?", 3, 2, 2],
    ["Chives to swap!", 6, 3, 3],
    ["Basil Seeds Available", 4, 4, 4],
    ["Beautiful Poppy Seeds!", 3, 5, 5],
    ["Cilantrooo", 5, 6, 6],
    ["Grapefruit", 3, 7, 7],
    ["Arugula anyone?", 3, 1, 5],
    ["Arugula anyone?", 3, 3, 2],
    ["Cilantro!", 3, 2, 6],
    ["Tomatoes!!", 3, 5, 1],
    ["Arugula anyone?", 3, 6, 2],
    ["Chives to swap!", 6, 7, 3],
    ["Basil Seeds Available", 4, 7, 4],
    ["Beautiful Poppy Seeds!", 3, 6, 5],
    ["Cilantrooo", 5, 5, 6],
    ["Grapefruit", 3, 4, 7],
    ["Arugula anyone?", 3, 3, 5],
    ["Arugula anyone?", 3, 2, 2],
    ["Cilantro!", 3, 1, 6]
]

swap_list.each do |title, quantity, user_id, seed_id|
    Swap.create(title: title, quantity: quantity, user_id: user_id, seed_id: seed_id)
end




  
