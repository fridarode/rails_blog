class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(user_id:params[:userid], title:params[:title], content:params[:content])
  end

  def show
    @posts = Posts.all
  end

  def destroy
    
  end
end
