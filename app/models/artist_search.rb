# frozen_string_literal: true

class ArtistSearch
  include ActiveModel::Model

  RESULTS_PER_PAGE = 10

  attr_reader :page, :search

  def initialize(page:, search: nil)
    @search = search
    @page = page.presence || 1
  end

  def artists
    artist_search.sorted.page(page).per(RESULTS_PER_PAGE)
  end

  def artist_count
    artist_search.count
  end

  private

  def artist_search
    @artist_search ||= artist_query
  end

  def artist_query
    if search.present?
      Artist.where("lower(name) like '%#{search.downcase.strip}%'")
    else
      Artist.all
    end
  end
end
