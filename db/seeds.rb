# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    #user = User.new
    #user.email = "ro@ru.com"
    #user.pseudo = "ro ru"
    #user.admin = true
    #user.password = 123456
    #user.save!

    user = User.new
    user.email = "guest@general.com"
    user.pseudo = "guest general"
    #user.admin = true
    user.password = "123456"
    user.save!

    user = User.new
    user.email = "guest@admin.com"
    user.pseudo = "guest admin"
    user.admin = true
    user.password = "123456"
    user.save!

    
    user = User.new
    user.email = "bob@bi.com"
    user.pseudo = "bob yan"
    #user.admin = true
    user.password = "123456"
    user.save!

    user = User.new
    user.email = "boby@gmail.com"
    user.pseudo = "boby lo"
    #user.admin = true
    user.password = "123456"
    user.save!

    user = User.new
    user.email = "bryan@io.com"
    user.pseudo = "bryan ocon"
    #user.admin = true
    user.password = "123456"
    user.save!

    product = Product.new
    product.price = 1000
    product.description = "description"
    product.user_id = User.find_by(email: "guest@general.com").id
    product.save

    product = Product.new
    product.price = 1000
    product.description = "description"
    product.user_id = User.find_by(email: "guest@admin.com").id
    product.save

    product = Product.new
    product.price = 1000
    product.description = "description"
    product.user_id = User.find_by(email: "bob@bi.com").id
    product.save

    product = Product.new
    product.price = 1000
    product.description = "description"
    product.user_id = User.find_by(email: "boby@gmail.com").id
    product.save

    product = Product.new
    product.price = 1000
    product.description = "description"
    product.user_id = User.find_by(email: "bryan@io.com").id
    product.save

    message = Message.new
    message.email = "visit@gmail.com"
    message.messages = "messages"
    message.user_id = User.find_by(email: "guest@general.com").id
    message.save

    message = Message.new
    message.email = "visit@gmail.com"
    message.messages = "messages"
    message.user_id = User.find_by(email: "guest@admin.com").id
    message.save

    message = Message.new
    message.email = "visit@gmail.com"
    message.messages = "messages"
    message.user_id = User.find_by(email: "bob@bi.com").id
    message.save

    message = Message.new
    message.email = "visit@gmail.com"
    message.messages = "messages"
    message.user_id = User.find_by(email: "boby@gmail.com").id
    message.save

    message = Message.new
    message.email = "visit@gmail.com"
    message.messages = "messages"
    message.user_id = User.find_by(email: "bryan@io.com").id
    message.save

    archive = Archive.new
    archive.archive = true
    archive.product_id = User.find_by(email: "guest@general.com").product_ids.first
    archive.save

    archive = Archive.new
    archive.archive = true
    archive.product_id = User.find_by(email: "guest@admin.com").product_ids.first
    archive.save

    archive = Archive.new
    archive.archive = true
    archive.product_id = User.find_by(email: "bob@bi.com").product_ids.first
    archive.save

    archive = Archive.new
    archive.archive = true
    archive.product_id = User.find_by(email: "boby@gmail.com").product_ids.first
    archive.save

    archive = Archive.new
    archive.archive = true
    archive.product_id = User.find_by(email: "bryan@io.com").product_ids.first
    archive.save

# 4.times do |j|
#    product = Product.new
#    product.price = 1000 + j
#    product.description = "description#{j+1}"
#    product.user_id = User.find(j+1).id
#    product.save
# end
# 4.times do |j|
 #   message = Message.new
 #   message.email = "visit#{j+1}@gmail.com"
 #   message.messages = "messages#{j+1}"
 #   message.user_id = User.find(j+1).id
 #   message.save
 #end
