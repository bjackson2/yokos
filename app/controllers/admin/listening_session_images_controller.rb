# frozen_string_literal: true

module Admin
  class ListeningSessionImagesController < AdminController
    before_action :validate_user

    def destroy
      listening_session = ListeningSession.friendly.find(params[:listening_session_id])
      listening_session.images.find(params[:id]).purge

      redirect_to admin_listening_session_path(listening_session)
    end

    private

    def album_params
      params.require(:album).permit(:title, :file_under, :main_image, :release_date)
    end
  end
end
