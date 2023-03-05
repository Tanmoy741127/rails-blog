class ArticlesController < ApplicationController

    before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    #    render plain: params[:article].inspect
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        flash[:notice] = "Article was successfully created"
        format.html { redirect_to @article, notice: "Article was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    # Try catch
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Article not found"
      redirect_to articles_path
    end
  end

  def edit
    @article = Article.find(params[:id])
    render
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        flash[:notice] = "Article was successfully updated"
        format.html { redirect_to @article }
      else
        flash[:notice] = "Article was not updated"
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
        @article.destroy
        flash[:notice] = "Article was deleted"
        format.html { redirect_to articles_path }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
