# frozen_string_literal: true

module AlbumHelper
  def album_display_name(album)
    return '' unless album

    "#{album.artist.name} - #{album.title}"
  end

  def album_search_display_name(album)
    return '' unless album

    "#{album.title} - #{album.artist.name}"
  end
end
