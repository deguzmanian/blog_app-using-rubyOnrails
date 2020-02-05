class ArticlesController < ApplicationController
    skip_before_action :authorized

    def index
        # @articles = Article.where(user_id: session[:user_id]) # allows user to see the articles they create
        # @articles = Article.all # allows the user to see all the articles saved...
        @article = Article.new
        @articles = Article.paginate(page: params[:page], per_page: 5).order('created_at DESC')
        @maximum_length = Article.validators_on(:context).first.options[:maximum]
    end

    def show
        @article = Article.find(params[:id])
        @comment = @article.comments.build
    end

    def new
        @article = Article.new 
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        @article.user_id = session[:user_id]
        if @article.save
            redirect_to @article
        else
            render 'index'
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
            params.require(:article).permit(:title, :context)
        end
end
