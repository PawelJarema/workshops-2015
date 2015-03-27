# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Roles
['registered', 'banned', 'moderator', 'admin'].each do |role|
	Role.find_or_create_by({name: role})
end

# Create Users
User.destroy_all
names = ['Błażej', 'Josh', 'Min', 'Jarek', 'Lindsey', 'Michael', 'Travis', 'Kian']
surnames = ['the Rich', 'the Funny', 'the Solid', 'the Mature', 'the Bronze', 'de Smart', 'the Meaningful', 'the Just']
name_table_size = names.count > surnames.count ? surnames.count : names.count

users = 5.times.map { |num| User.create({ firstname: names[rand(name_table_size)], lastname: surnames[rand(name_table_size)], role: (num == 1 ? Role.find_by_name('admin') : nil), email: "topsecret#{num}@o2.pl", password: 'topsecret', password_confirmation: 'topsecret' }) }
users_table_size = users.count

# Create categories
Category.destroy_all
categories = ['3d prints', 'Plushies', 'Robots']

categories = categories.map { |category| Category.find_or_create_by({ name: category }) }	
categories_table_size = categories.count

# Create products
Product.destroy_all
product_names = ['Applejack', 'Rainbow Dash', 'Pinkie Pie', 'Rarity', 'Twilight Sparkle', 'Fluttershy', 'Maud Pie', 'DJ PON3', 'Lyra', 'BonBon', 'Applebloom', 'Scootaloo', 'Sweetie Belle', 'Tank', 'Luna', 'Celestia', 'Shining Armor', 'Chrysalis', 'Cadence', 'Minuette', 'Colgate', 'Diamond Tiara', 'Bulk Biceps', 'Silverspoon', 'Pip', 'Baby Cakes']
descriptions = ['You asked for it, you got it. Brand new and shiny', 'Good quality, made with purpose in mind', 'Colorful, made with quality material']
products = 25.times.map { |num| Product.create({ title: product_names[num], description: descriptions[rand(descriptions.count)], price: (rand * rand(1000)).round(2) , category: categories[rand(categories_table_size)], user: users[rand(users_table_size)] }) }
products_table_size = products.count

# Create reviews
Review.destroy_all
users.each do |user|
	10.times.each { Review.create({ content: 'Awesome awesomeness!', rating: (3 + rand(3)), user: user, product: products[rand(products_table_size)] }) }
end