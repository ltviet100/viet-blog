class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was created!"
      redirect_to article_path(@article)
    else
      flash[:info] = "Article was not created!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was updated!"
      redirect_to article_path(@article)
    else
      flash[:info] = "Article was not updated!"
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was removed!"
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description, :user_id)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
