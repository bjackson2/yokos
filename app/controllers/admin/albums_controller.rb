# frozen_string_literal: true

module Admin
  class AlbumsController < AdminController
    before_action :validate_user

    def new
      @artist = Artist.find(params[:artist_id])
      @album = @artist.albums.new
    end

    def create
      @artist = Artist.find(params[:artist_id])
      @album = @artist.albums.new(album_params[:album])
      @album.save

      if @album.errors.any?
        flash.now[:error] = model_error_display(@album)
        render :new
      else
        redirect_to admin_artist_path(@artist)
      end
    end

    def edit
      @artist = Artist.find(params[:artist_id])
      @album = @artist.albums.find(params[:id])
    end

    def update
      @artist = Artist.find(params[:artist_id])
      @album = @artist.albums.find(params[:id])
      @album.update(album_params[:album])

      if @album.errors.any?
        flash.now[:error] = model_error_display(@album)
        render :edit
      else
        redirect_to admin_artist_path(@artist)
      end
    end

    private

    def album_params
      params.permit(
        :authenticity_token,
        album: %i[
          title
          file_under
          main_image
          release_date
        ]
      )
    end
  end
end
