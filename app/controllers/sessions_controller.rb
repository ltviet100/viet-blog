class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully!"
      redirect_to user_path(user)
    else
      flash[:danger] = "Failed login!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logout successfully!"
    redirect_to root_path
  end
end
