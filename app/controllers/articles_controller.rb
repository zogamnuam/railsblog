class ArticlesController < ApplicationController
	
	def index
    	@articles = Article.all
  	end

	def show
    	@article = Article.find(params[:id])
  	end

	def new
		@article = Article.new
	end

	def create
        @article = Article.new(article_params)
        Rails.logger.debug('before save')
        @article.save
        Rails.logger.debug('after save')
        redirect_to @article
    end

	private
		def article_params
			article_params.require(:article).permit(:title, :text)
		end
end