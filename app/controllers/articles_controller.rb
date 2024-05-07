class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # SHOW ALL
  def index
    @articles = Article.all
  end

  # SHOW ONE TASK
  def show
  end

  # CREATE - FORM
  def new
    @article = Article.new
  end
  # CREATE - CREATE NEW TASK
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  #UPDATE
  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  #DELETE
  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private
  # STRONG PARAMS
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
