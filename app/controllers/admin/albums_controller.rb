# frozen_string_literal: true

module Admin
  class AlbumsController < AdminController
    def new
      @artist = Artist.find(params[:artist_id])
      @album = @artist.albums.new
    end

    def create
      @artist = Artist.find(params[:artist_id])
      @album = @artist.albums.new(album_params)
      @album.save

      if @album.errors.any?
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
      @album.update(album_params)

      if @album.errors.any?
        render :edit
      else
        redirect_to admin_artist_path(@artist)
      end
    end

    private

    def album_params
      params.require(:album).permit(:title, :file_under, :main_image, :release_date)
    end
  end
end
