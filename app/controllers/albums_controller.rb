class AlbumsController < ApplicationController
  def index
    @album_search = AlbumSearch.new(
      search: album_params.dig(:album_search, :search),
      page: album_params[:page]
    )
    @albums = @album_search.albums
  end

  private

  def album_params
    params.permit(
      :authenticity_token,
      :page,
      album_search: [
        :search
      ]
    )
  end
end
