class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit ]
  before_action :get_movie
  before_action :get_review, only: [ :edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.movie_id = @movie.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :rating, :comment)
  end

  def get_movie
    @movie = Movie.find(params[:movie_id])
  end

 def get_review
   @review = Review.find(params[:id])
 end
end
