require_relative 'config/application'
require_relative 'models/post'
require_relative 'models/user'

def ask(prompt)
  print "#{prompt} "
  gets.chomp
end

def create_post(user)
  name = ask('Name:')
  source_url = ask('Source URL:')
  rating = ask('Rating:')
  post_params = { name: name, source_url: source_url, date: Time.now, rating: rating }

  # TODO: use ActiveRecord to add a new post for the user logged in!
  user.posts.create(post_params)
end

def list_posts(user)
  # TODO: use ActiveRecord to get all posts of the current user
  user.posts.all.each do |post|
    puts post.name
  end
end

def delete_posts(user)
  # TODO: use ActiveRecord to delete all posts of current user
  user.posts.destroy_all
end

def seed_users
  if User.count == 0
    10.times { User.create(name: Faker::Name.name, email: Faker::Internet.email) }
  end
end

seed_users

logged_in = false

until logged_in
  puts 'Please login with your <id>'
  # TODO: instantiate a user with his <id>
  user_id = gets.chomp
  user = User.find_by_id(user_id)
  if user
    logged_in = true
  else
    puts "Your id is invalid"
  end
end

exit = true

while exit
  puts "Hey #{user.name}, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Exit"

  case ask('>').to_i
  when 1 then create_post(user)
  when 2 then list_posts(user)
  when 3 then delete_posts(user)
  when 4 then exit = false
  end
end
