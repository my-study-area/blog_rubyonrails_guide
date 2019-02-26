class CommentsController < ApplicationController
  def index
    begin
      @article = Article.find(params[:article_id])
      @article.comments.new
      @comments = Comment.where(article_id: params[:article_id])
    rescue
      @article = {}
      @comments = {}
    end

    respond_to do |format|
      format.html { render 'articles/show', status: 200 }
      format.json { render json: @comments , status: 200}
    end
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    if(@comment.valid?)
      # @article.errors = @comment.errors
      @comment.save
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id)
  end
end
