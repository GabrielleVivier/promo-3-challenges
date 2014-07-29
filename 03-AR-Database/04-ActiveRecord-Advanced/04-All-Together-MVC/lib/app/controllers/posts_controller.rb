require_relative '../views/posts_view'

class PostsController

  def initialize
    @view = PostsView.new
  end

  def list
    @view.display_all(Post.all)
  end

  def vote(post_id)
    post = Post.find_by_id(post_id)
    if post
      post.rating = post.rating + 1
      post.save
    else
      @view.missing_post
    end
  end

end