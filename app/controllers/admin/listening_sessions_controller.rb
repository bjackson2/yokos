module Admin
  class ListeningSessionsController < AdminController
    def index
      @listening_sessions = ListeningSession.sorted
    end

    def new
      @listening_session = ListeningSession.new
    end

    def create
      @listening_session = ListeningSession.new(listening_session_params)
      @listening_session.save

      if @listening_session.errors.any?
        binding.pry
        render :new
      else
        redirect_to admin_listening_sessions_path
      end
    end

    def edit
      @listening_session = ListeningSession.find(params[:id])
    end

    def update
      @listening_session = ListeningSession.find(params[:id])
      @listening_session.update(listening_session_params)

      if @listening_session.errors.any?
        render :edit
      else
        redirect_to admin_listening_sessions_path
      end
    end

    private

    def listening_session_params
      params.require(:listening_session).permit(
        :date, :session_type, :theme, :notes, images: []
      )
    end
  end
end