# frozen_string_literal: true

# rubocop:disable Style/CaseLikeIf

module LinkHelper
  def link_form_redirect_path(link)
    if link.owner.is_a?(Album)
      admin_artist_path(link.owner.artist)
    elsif link.owner.is_a?(Artist)
      admin_artist_path(link.owner)
    elsif link.owner.is_a?(Movie)
      movie_path(link.owner)
    elsif link.owner.is_a?(ListeningSession)
      admin_listening_session_path(link.owner)
    else
      admin_artists_path
    end
  end

  def link_owner_text(link)
    if link.owner.is_a?(Album)
      album_display_name(link.owner)
    elsif link.owner.is_a?(Artist)
      link.owner.name
    elsif link.owner.is_a?(Movie)
      link.owner.title
    elsif link.owner.is_a?(ListeningSession)
      "Session on #{link.owner.date.strftime('%B %-d, %Y')}"
    else
      'N/A'
    end
  end
end

# rubocop:enable Style/CaseLikeIf
