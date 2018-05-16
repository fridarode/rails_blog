class UsersController < ApplicationController
  def index
    @users = User.all
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
      redirect_to 'users#show'
    else
      redirect_to 'users#index'
    end
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path

  end

  def update
    @edit = update(user_params)
  end


  private
  def user_params
    params.require(:user).permit(:fname, :lname, :username, :password)
  end

end
