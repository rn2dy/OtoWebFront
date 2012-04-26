class UsersController < ApplicationController

  def new
    @user = User.new
  end

  ## User Sing up
  def create
    @user = User.new params[:user]
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to dashboard_path, notice: "You have succefully signed up!"
    else
      render "new"
    end
  end

end
