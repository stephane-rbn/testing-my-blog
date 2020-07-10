class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      flash[:notice] = 'New article successfully added!'
      redirect_to @article
    else
      flash[:error] = 'Wrong submission. Try again!'
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article successfully edited!'
      redirect_to @article
    else
      flash[:alert] = 'Wrong submission. Try again!'
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article successfully deleted!'

    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
end
