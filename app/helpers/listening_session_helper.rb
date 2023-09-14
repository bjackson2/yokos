module ListeningSessionHelper
  def session_type_select_options
    ListeningSession.session_types.values.map { |v| [v.humanize, v] }
  end
end