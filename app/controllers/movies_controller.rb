class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_movie, only:[ :show, :edit, :update, :destroy ]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @movie = Movie.new(movie_params)
    @categories = Category.all.map{ |c| [c.name, c.id] }
    @movie.category_id = params[:category_id]
    if @movie.save
      flash[:notice] = 'Movie has been created.'
      redirect_to movies_path
    else
      flash.now[:alert] = 'Movie has not been saved.'
      render 'new'
    end

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @categories = Category.all.map{ |c| [c.name, c.id] }
    if @movie.update(movie_params)
      flash[:notice] = 'Movie has been updated.'
    else
      flash.now[:alert] = 'Movie has not been update'
      render 'new'
    end
    redirect_to movie_path
  end

  def destroy
    @movie.destroy
    flash[:notice ] = 'Movie has been deleted.'
    redirect_to movies_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
  def movie_params
    params.require(:movie).permit(:title, :description, :genre, :category_id)
  end
end
