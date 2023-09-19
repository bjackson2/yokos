class Album < ApplicationRecord
  belongs_to :artist
  has_many :listening_sessions, through: :listening_session_albums
  has_many :pickers, through: :listening_session_albums, as: :yokos_member
  has_one_attached :main_image

  validates :title, presence: true
  validates :release_date, presence: true

  scope :sorted, -> { order(Arel.sql("CASE WHEN albums.file_under IS NULL OR albums.file_under = '' THEN lower(albums.title) ELSE lower(albums.file_under) END ASC")) }

  def self.search(album_query)
    query_string = album_query.downcase.strip

    joins(:artist).where("lower(albums.title) like '%#{album_query}%' or lower(artists.name) like '%#{album_query}%'").sorted.first(10)
  end
end