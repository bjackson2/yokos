# frozen_string_literal: true

class ArtistsController < ApplicationController
  before_action :validate_user, only: %i[new create edit update]

  def index
    @artist_search = ArtistSearch.new(
      search: artist_params.dig(:artist_search, :search),
      page: artist_params[:page]
    )
    @artists = @artist_search.artists
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new

    @artist.update(artist_params[:artist])

    if @artist.errors.any?
      flash.now[:error] = model_error_display(@artist)
      render :new
    else
      redirect_to artist_path(@artist)
    end
  end

  def edit
    @artist = Artist.friendly.find(params[:id])
  end

  def update
    @artist = Artist.friendly.find(params[:id])

    @artist.update(artist_params[:artist])

    if @artist.errors.any?
      flash.now[:error] = model_error_display(@artist)
      render :edit
    else
      redirect_to artist_path(@artist)
    end
  end

  def show
    @artist = Artist.friendly.find(params[:id])
  end

  private

  def artist_params
    params.permit(
      :authenticity_token,
      :page,
      artist_search: %i[
        search
      ],
      artist: %i[
        name
        file_under
        main_image
      ]
    )
  end
end
