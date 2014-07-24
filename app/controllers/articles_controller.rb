class ArticlesController < ApplicationController



   def index
      if params[:tag].present?
         @articles = Article.tagged_with(params[:tag])
      else
         @articles = Article.all
      end
      @articles = Article.paginate(:page => params[:page], :per_page => 5)
   end

   def new
     @article = Article.new
   end

   def create

    @article = Article.new(article_params)
      if @article.save
         redirect_to @article, notice: 'user was successfully created.'
      else
        render'new'
      end
   end

   def show
     @article = Article.find(params[:id])
   end

  def edit
     @article = Article.find(params[:id])
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
       params.require(:article).permit(:title, :text, :avatar,:tag_list,:signup)
   end
end
