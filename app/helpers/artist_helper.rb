# frozen_string_literal: true

module ArtistHelper
  def artist_display_name(artist)
    artist.file_under.presence || artist.name
  end
end
