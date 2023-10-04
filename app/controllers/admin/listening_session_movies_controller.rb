# frozen_string_literal: true

module Admin
  class ListeningSessionMoviesController < AdminController
    before_action :validate_user

    def new
      @listening_session = ListeningSession.find(params[:listening_session_id])
      @listening_session_movie = @listening_session.listening_session_movies.new
    end

    def create
      @listening_session = ListeningSession.find(params[:listening_session_id])
      @listening_session_movie = @listening_session.listening_session_movies.new(listening_session_movie_params)
      @listening_session_movie.save

      if @listening_session_movie.errors.any?
        render :new
      else
        redirect_to admin_listening_session_path(@listening_session)
      end
    end

    def destroy
      listening_session = ListeningSession.find(params[:listening_session_id])
      listening_session.listening_session_movies.find_by(movie_id: params[:id]).destroy!

      redirect_to admin_listening_session_path(listening_session)
    end

    private

    def listening_session_movie_params
      params.require(:listening_session_movie).permit(:movie_id)
    end
  end
end
