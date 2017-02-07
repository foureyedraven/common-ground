class PostsController < ApplicationController
  def index
    @posts = BlogPost.published.order('id desc')
  end

  def show
    @post = BlogPost.published.find_by_slug!(params[:slug])
  end
  
  def search
    @posts = blog_posts_with_links.search(params[:query])
    render action: 'index'
  end
end
