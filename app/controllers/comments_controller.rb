class CommentsController < ApplicationController
  before_action :find_article, only: [:create, :destroy]
  before_action :authenticate_user!, except: [:create, :destroy]

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'New comment successfully added!'
      redirect_to @article
    else
      flash[:error] = 'Wrong submission. Try again!'
      render :index
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment successfully deleted!'
    redirect_to @article
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
