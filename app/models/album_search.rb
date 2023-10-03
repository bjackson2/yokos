# frozen_string_literal: true

class AlbumSearch
  include ActiveModel::Model

  attr_reader :page, :search

  def initialize(page: nil, search: nil)
    @search = search
    @page = page.presence || 1
  end

  def albums
    album_search.sorted.page(page)
  end

  def album_count
    album_search.count
  end

  private

  def album_search
    @_album_search ||= if search.present?
                         parsed_search = search.downcase.strip

                         Album
                           .joins(:artist)
                           .where("lower(albums.title) like '%#{parsed_search}%' or lower(artists.name) like '%#{parsed_search}%'")
                       else
                         Album.all
                       end
  end
end
