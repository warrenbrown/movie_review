class MoviesController < ApplicationController
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
  private
  def movie_params
    params.require(:movie).permit(:title, :description, :genre)
  end
end
