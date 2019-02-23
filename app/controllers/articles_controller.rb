class ArticlesController < ApplicationController
  def index
    @articles = Article.all()
  end

  def show
    @article = Article.find(params[:id])
    @article.comments.build
    @comment = Comment.where(article_id: params[:id])
    respond_to do |format|
      format.html { render @articles, status: 200 }
      format.json { render json: @articles, status: 200}
    end
  end

  def new
    @article = Article.new
    @comment = @article.comments.build
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
