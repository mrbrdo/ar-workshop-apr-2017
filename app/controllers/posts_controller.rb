class PostsController < ApplicationController
  def index
    @posts = filter_posts(Post.all)
  end

  def show
    # TODO: implement
    # @post =
  end

private
  def filter_posts(posts)
    # TODO: implement

    posts
  end
end
