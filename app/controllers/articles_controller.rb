class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "thomas", password: "password", except:
                                 [:index, :show]
	
	def index
    	@articles = Article.all
  	end

	def show
    	@article = Article.find(params[:id])
  	end

    def edit
        @article = Article.find(params[:id])
    end

	def new
		@article = Article.new
	end

	def create
        @article = Article.new(article_params)
        #Rails.logger.debug('before save')
        
        if @article.save
        #Rails.logger.debug('after save')
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
end