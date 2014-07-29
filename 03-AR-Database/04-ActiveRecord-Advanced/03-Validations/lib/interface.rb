require_relative 'config/application'
require_relative 'models/post'
require_relative 'models/user'

# TODO: Add some code to test your validations
# Test your validation by trying to create duplicated posts
# or users, users with invalid email,
# or negative number of ratings.

# user = User.create(name: nil, email: 'hjklk@lncl')

# puts user.valid?
# puts user.errors.messages

# user1 = User.create(name: "James Brown", email: "gabrielle.vivier@gmail.com")

# puts user1.valid?

# puts user1.errors.messages

# puts User.all

# user2 = User.create(name: "James Brown", email: "james.brown@gmail.com")

# puts user2.valid?

# user3 = User.create(name: "James Blunt", email: "james.blunt@gmail.com")

user = User.find(1)

post1 = user.posts.create(name: "XX", date: Time.now, source_url: "hljbbj.com", rating: 5)

puts post1.valid?
puts post1.errors.messages
