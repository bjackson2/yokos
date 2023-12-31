# frozen_string_literal: true

class ListeningSessionMoviesController < ApplicationController
  before_action :validate_user

  def new
    @listening_session = ListeningSession.friendly.find(params[:listening_session_id])
    @listening_session_movie = @listening_session.listening_session_movies.new
  end

  def create
    @listening_session = ListeningSession.friendly.find(params[:listening_session_id])
    @listening_session_movie = @listening_session.listening_session_movies.new(listening_session_movie_params)
    @listening_session_movie.save

    if @listening_session_movie.errors.any?
      render :new
    else
      redirect_to listening_session_path(@listening_session)
    end
  end

  def destroy
    listening_session = ListeningSession.friendly.find(params[:listening_session_id])
    listening_session.listening_session_movies.find { |lsm| lsm.movie.slug == params[:id] }.destroy!

    redirect_to listening_session_path(listening_session)
  end

  private

  def listening_session_movie_params
    params.require(:listening_session_movie).permit(:movie_id)
  end
end
