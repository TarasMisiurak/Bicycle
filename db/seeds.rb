# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "pierre@michaux.com", password: "progenitor", member: true, admin: true)

categories_list = [
    [ "First bicycles", "Lorem ipsum" ],
    [ "Modern bicycles", "Lorem ipsum" ],
    [ "Freaky stuff", "Lorem ipsum" ]
]

categories_list.each do |name, desc|
  Category.create(name: name, desc: desc)
end

bicycle_list = [
    # name, desc, created_by, category_id
  [ "First bicycle ever", "Lorem ipsum", 1, 0 ],
  [ "Second bicycle", "Lorem ipsum", 1, 0 ],
  [ "Weird stuff they did", "Lorem ipsum", 1, 2 ],
  [ "More weird stuff", "Lorem ipsum", 1, 2 ],
  [ "Today's bicycle", "Lorem ipsum", 1, 1 ],
  [ "One more", "Lorem ipsum", 1, 1 ],
  [ "Modern stuff", "Lorem ipsum", 1, 1 ],
  [ "Weird modern stuff", "Lorem ipsum", 1, 2 ],
  [ "More classics", "Lorem ipsum", 1, 0 ],
  [ "One more classic bicycle", "Lorem ipsum", 1, 0 ]
]

bicycle_list.each do |name, desc, user, category_id|
  Bicycle.create(name: name, desc: desc, user_id: user, category_id: category_id)
end
