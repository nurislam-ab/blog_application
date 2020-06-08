class ArticlesController < ApplicationController
include ArticlesHelper

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
        the first way of creating article instance
        @article = Article.new
        @article.title = params[:article][:title]
        @article.body = params[:article][:body]
        @article.save
        redirect_to article_path(@article)

        the second  way of creating article instance
         @article = Article.new(
            title: params[:article][:title],
            body: params[:article][:body])
          @article.save
          redirect_to article_path(@article)

        the third  way of creating article instance
        @article = Article.new(article_params)
        @article.save
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
end
