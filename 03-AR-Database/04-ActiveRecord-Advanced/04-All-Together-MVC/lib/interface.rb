require_relative 'config/application'
require_relative 'app/controllers/posts_controller'

#TODO: that's the entry point of your app.

posts_controller = PostsController.new

exit = false

until exit
  puts "Welcom to LeWagonNews"
  puts "What would you like to do?"
  puts "1 - List the existing posts"
  puts "2 - Vote for a post"
  puts "3 - Exit"

  action = gets.chomp.to_i

  case action
  when 1 then posts_controller.list
  when 2 then
    puts "What is the post you want to vote for?"
    post_id = gets.chomp.to_i
    posts_controller.vote(post_id)
  when 3 then exit = true
  end

end