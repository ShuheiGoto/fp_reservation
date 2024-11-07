class UsersController < ApplicationController
  def show
    @user = User.new(session[:user]) #User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def login
    session[:user]&.clear
    user = User.find_by!(email: params[:email])

    session[:user] = user
    redirect_to user_path(user.id)
  end

  def logout
    session[:user]&.clear

    redirect_to new_user_path
  end
end
