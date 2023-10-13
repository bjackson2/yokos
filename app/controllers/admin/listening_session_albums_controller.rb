# frozen_string_literal: true

module Admin
  class ListeningSessionAlbumsController < AdminController
    skip_before_action :verify_authenticity_token, only: :index
    before_action :validate_user, only: %i[new create destroy]

    def index
      @listening_session = ListeningSession.friendly.find(params[:listening_session_id])
      @albums = AlbumSearch.new(search: params[:q]).albums

      respond_to(&:turbo_stream)
    end

    def new
      @listening_session = ListeningSession.friendly.find(params[:listening_session_id])
      @listening_session_album = @listening_session.listening_session_albums.new

      return unless params[:album_id]

      @listening_session_album.album = Album.find(params[:album_id])
    end

    def create
      @listening_session = ListeningSession.friendly.find(params[:listening_session_id])
      @listening_session_album = @listening_session
                                 .listening_session_albums
                                 .new(listening_session_album_params.except(:album))
      @listening_session_album.save

      if @listening_session_album.errors.any?
        render :new
      else
        redirect_to admin_listening_session_path(@listening_session)
      end
    end

    def destroy
      listening_session = ListeningSession.friendly.find(params[:listening_session_id])
      listening_session.listening_session_albums.find_by(album_id: params[:id]).destroy!

      redirect_to admin_listening_session_path(listening_session)
    end

    private

    def listening_session_album_params
      params.require(:listening_session_album).permit(:album, :yokos_member_id, :album_id)
    end
  end
end
