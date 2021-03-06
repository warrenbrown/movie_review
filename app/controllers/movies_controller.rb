class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_movie, only:[ :show, :edit, :update, :destroy ]

  def index
    if params[:category].blank?
      @movies = Movie.all.order("created_at DESC")
    else
      #@category_id = Category.find(name: params[:category]).id
      @category_id = Category.find_by(name: params[:category]).id
      @movies = Movie.where(:category_id => @category_id).order("created_at DESC")
    end
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
    if @movie.reviews.blank?
      @average_review = 0
    else
      @average_review = @movie.reviews.average(:rating).round(2)
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @categories = Category.all.map{ |c| [c.name, c.id] }
    if @movie.update(movie_params)
      flash[:notice] = 'Movie has been updated.'
      redirect_to movie_path
    else
      flash.now[:alert] = 'Movie has not been update'
      render 'new'
    end

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
    params.require(:movie).permit(:title, :description, :genre, :category_id, :movie_image)
  end
end
