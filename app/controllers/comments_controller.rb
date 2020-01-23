class CommentsController < ApplicationController
    skip_before_action :authorized
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def edit
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
    end

    def show
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
    end

    def update
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        if @comment.update(comment_params)
            redirect_to @comment
        else
            render 'edit'
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
        params.require(:comment).permit(:commenter, :body)
    end
end