class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    # Check if there is a user with that username, and check if the password is that user's password.
    if @user && @user.password == params[:session][:password]
        puts 'LOGIN SUCCESSFUL'
        log_in(@user)
        redirect_to user_path @user
    else
        puts 'LOGIN FAILED'
        redirect_to login_path
    end
  end

  def destroy
  end
end
