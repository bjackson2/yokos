module Admin
  class ListeningSessionAlbumsController < AdminController
    skip_before_action :verify_authenticity_token, only: :index

    def index
      @listening_session = ListeningSession.find(params[:listening_session_id])
      @albums = Album.search(params[:q])

      respond_to { |format| format.turbo_stream }
    end

    def new
      @listening_session = ListeningSession.find(params[:listening_session_id])
      @listening_session_album = @listening_session.listening_session_albums.new

      if params[:album_id]
        @listening_session_album.album = Album.find(params[:album_id])
      end
    end

    def create
      @listening_session = ListeningSession.find(params[:listening_session_id])
      @listening_session_album = @listening_session.listening_session_albums.new(listening_session_album_params.except(:album))
      @listening_session_album.save

      if @listening_session_album.errors.any?
        render :new
      else
        redirect_to edit_admin_listening_session_path(@listening_session)
      end
    end

    def destroy
      listening_session = ListeningSession.find(params[:listening_session_id])
      listening_session.listening_session_albums.find_by(album_id: params[:id]).destroy!

      redirect_to edit_admin_listening_session_path(listening_session)
    end

    private

    def listening_session_album_params
      params.require(:listening_session_album).permit(:album, :yokos_member_id, :album_id)
    end
  end
end