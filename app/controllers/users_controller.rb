class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]
  before_action :require_exact_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Hello #{@user.username} - Welcome to my blog!"
      redirect_to user_path(@user)
    else
      flash[:info] = "Failed Sign Up!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Updated User!"
      redirect_to articles_path
    else
      flash[:info] = "Failed Update!"
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_exact_user
      if current_user != @user
        flash[:danger] = "You can only edit your accout"
        redirect_to root_path
      end
    end
end
