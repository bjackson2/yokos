# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :validate_user, except: :index

  def index
    @album_search = AlbumSearch.new(
      search: album_params.dig(:album_search, :search),
      page: album_params[:page]
    )
    @albums = @album_search.albums
  end

  def new
    @artist = Artist.friendly.find(params[:artist_id])
    @album = @artist.albums.new
  end

  def create
    @artist = Artist.friendly.find(params[:artist_id])
    @album = @artist.albums.new(album_params[:album])
    @album.save

    if @album.errors.any?
      flash.now[:error] = model_error_display(@album)
      render :new
    else
      redirect_to artist_path(@artist)
    end
  end

  def edit
    @artist = Artist.friendly.find(params[:artist_id])
    @album = @artist.albums.find(params[:id])
  end

  def update
    @artist = Artist.friendly.find(params[:artist_id])
    @album = @artist.albums.find(params[:id])
    @album.update(album_params[:album])

    if @album.errors.any?
      flash.now[:error] = model_error_display(@album)
      render :edit
    else
      redirect_to artist_path(@artist)
    end
  end

  def destroy
    artist = Artist.friendly.find(params[:artist_id])
    album = artist.albums.find(params[:id])

    album.destroy!

    redirect_to artist_path(artist)
  end

  private

  def album_params
    params.permit(
      :authenticity_token,
      :page,
      album_search: [
        :search
      ],
      album: %i[
        title
        file_under
        main_image
        release_date
      ]
    )
  end
end
