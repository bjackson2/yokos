# frozen_string_literal: true

module LinkHelper
  def link_form_redirect_path(link)
    if link.owner.is_a?(Album) || link.owner.is_a?(Artist)
      admin_artist_path(link.owner.artist)
    else
      admin_artists_path
    end
  end

  def link_owner_text(link)
    if link.owner.is_a?(Album)
      album_display_name(link.owner)
    else
      'N/A'
    end
  end
end
