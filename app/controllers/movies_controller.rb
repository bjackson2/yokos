# frozen_string_literal: true

class MoviesController < AdminController
  before_action :validate_user, only: %i[new create edit update destroy]

  def index
    @movies = Movie.sorted
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params[:movie])
    @movie.save

    if @movie.errors.any?
      flash.now[:error] = model_error_display(@movie)
      render :new
    else
      redirect_to movie_path(@movie)
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params[:movie])

    if @movie.errors.any?
      flash.now[:error] = model_error_display(@movie)
      render :edit
    else
      redirect_to movie_path(@movie)
    end
  end

  private

  def movie_params
    params.permit(
      :authenticity_token,
      movie: %i[
        title
        file_under
        main_image
        release_year
        artist_id
      ]
    )
  end
end
