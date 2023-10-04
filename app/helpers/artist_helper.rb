# frozen_string_literal: true

module ArtistHelper
  def artist_display_name(artist)
    artist.file_under.presence || artist.name
  end

  def artist_select_options
    Artist.sorted.map { |artist| [artist.name, artist.id] }.unshift(['--', nil])
  end
end
