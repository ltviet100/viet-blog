class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created!"
      redirect_to categories_path
    else
      flash[:info] = "Category was not created!"
      render 'new'
    end
  end

  def show
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category was updated!"
      redirect_to category_path(@category)
    else
      flash[:info] = "Category was not updated!"
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:danger] = "Removed this category and all its articles!"
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end

    def require_admin
      if !logged_in? || (logged_in? && !current_user.admin? )
        flash[:danger] = "Only admins can perform that action"
        redirect_to categories_path
      end
    end
end
