class PostsController < ApplicationController
  def index
    @posts = filter_posts(Post.includes(:category))
  end

  def show
    @post = Post.where(slug: params[:id]).first
  end

private
  def filter_posts(posts)
    return posts unless params[:filter] == 'on'

    if params[:category_ids].present?
      posts = posts.where(category_id: params[:category_ids])
    end
    if params[:published]
      posts = posts.where(published: true)
    end
    if params[:published_after].present?
      posts = posts.where("published_at > ?", DateTime.parse(params[:published_after]))
    end
    if params[:published_before].present?
      posts = posts.where("published_at < ?", DateTime.parse(params[:published_before]))
    end
    if params[:title].present?
      posts = posts.where("posts.title LIKE ?", "%#{params[:title]}%")
    end

    order_dir = params[:order_dir]
    order_dir = "asc" unless order_dir.in?(["asc", "desc"])

    posts =
      case params[:order_by]
      when 'Published Time'
        posts.order("published_at #{order_dir}")
      when 'Category Title'
        posts.joins(:category).order("categories.title #{order_dir}")
      else
        posts.order("posts.title #{order_dir}")
      end

    posts
  end
end
