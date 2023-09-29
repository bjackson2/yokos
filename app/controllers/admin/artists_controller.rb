# frozen_string_literal: true

module Admin
  class ArtistsController < AdminController
    before_action :validate_user, only: %i[new create edit update]

    def index
      @artists = Artist.all.sorted
    end

    def new
      @artist = Artist.new
    end

    def create
      @artist = Artist.new

      @artist.update(artist_params)

      if @artist.errors.any?
        render :new
      else
        redirect_to admin_artist_path(@artist)
      end
    end

    def edit
      @artist = Artist.find(params[:id])
    end

    def update
      @artist = Artist.find(params[:id])

      @artist.update(artist_params)

      if @artist.errors.any?
        render :edit
      else
        redirect_to admin_artist_path(@artist)
      end
    end

    def show
      @artist = Artist.find(params[:id])
    end

    private

    def artist_params
      params.require(:artist).permit(
        :name,
        :file_under,
        :main_image
      )
    end
  end
end
