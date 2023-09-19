module ListeningSessionHelper
  def session_type_select_options
    ListeningSession.session_types.values.map { |v| [v.humanize, v] }
  end

  def session_member_select_options
    YokosMember.sorted.map { |member| [ member.name, member.id ] }.unshift(["--", nil])
  end
end