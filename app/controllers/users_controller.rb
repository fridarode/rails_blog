class UsersController < ApplicationController
  def index
    @users = User.all

  end

  def home
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def new
    @user = User.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    log_out
    redirect_to root_path

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  private
  def user_params
    params.require(:user).permit(:fname, :lname, :username, :password)
  end

end
