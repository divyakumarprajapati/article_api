class ArticlesController < ApplicationController
  def index
    result = Article.all
    if result
      render json: result
    else
      render json: {}
    end
  end

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @articles = Article.new
  end

  def create
    result = Article.new(title: params['title'], body: params['body'])

    if result.save
      render json: result
    else
      render :new, status: :unprocessable_entity
    end
  end
end
