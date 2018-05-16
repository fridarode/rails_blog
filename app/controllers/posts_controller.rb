class PostsController < ApplicationController
  before_action :require_user
 def index
   @posts = Post.all
 end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      p @post.errors.full_messages
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
