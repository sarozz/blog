class ArticlesController < ApplicationController

	before_action :find_article, only: [:edit,:update, :destroy]

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
		if @article.save
			redirect_to @article
			flash[:success] = "Article saved successfully"
		else
			redirect_to new_article_path
			flash[:error] = "Article could not be saved"
		end    
	end
	def edit
		
	end

	def update
		if @article.update_attributes(article_params)
			redirect_to article_path
			flash[:success] = "Article updated successfylly"
		else
			flash[:error] = "Article was not updated"
		end
	end

	def destroy
		if @article.delete
		redirect_to @article 
			flash[:sucess] = "Deleted"
		else
			flash[:error] = "Could not delete"
		end
	end

	private

	def article_params
		params.require(:article).permit(:title, :description)
	end

	def find_article
		@article = Article.find(params[:id])
	end	

end