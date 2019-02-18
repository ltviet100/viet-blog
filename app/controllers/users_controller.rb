class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Viet's Blog #{@user.username}"
      redirect_to articles_path
    else
      flash[:info] = "Failed Sign Up!"
      render 'new'
    end
  end
end
