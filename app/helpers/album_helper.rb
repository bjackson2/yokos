module AlbumHelper
  def album_display_name(album)
    return "" if !album

    "#{album.artist.name} - #{album.title}"
  end
end