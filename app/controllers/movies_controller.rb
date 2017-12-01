class MoviesController < ApplicationController
  before_action :set_movie, only:[ :show, :edit, :update, :destroy ]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Movie has been created.'
    else
      flash.now[:alert] = 'Movie has not been saved.'
      render 'new'
    end
    redirect_to movies_path
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    if @movie.update(movie_params)
      flash[:notice] = 'Movie has been updated.'
    else
      flash.now[:alert] = 'Movie has not been update'
      render 'new'
    end
    redirect_to movie_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
  def movie_params
    params.require(:movie).permit(:title, :description, :genre)
  end
end
