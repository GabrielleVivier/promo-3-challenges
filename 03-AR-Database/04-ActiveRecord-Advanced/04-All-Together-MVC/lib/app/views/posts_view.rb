class PostsView

  def display_all(all_posts)
    all_posts.each do |post|
      puts "#{post.id} - #{post.name} (Number of votes: #{post.rating})"
    end
  end

  def missing_post
    puts "This post does not exist"
  end

end