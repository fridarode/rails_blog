class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create(fname:params[:fname], lname:params[:lname], username:params[:username], password:params[:password])
  end

  def show
    @users = User.all
  end

  def destroy
  end

  def update

  end
end
