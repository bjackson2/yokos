class Album < ApplicationRecord
  belongs_to :artist
  has_many :listening_sessions, through: :listening_session_albums
  has_many :pickers, through: :listening_session_albums, as: :yokos_member
  has_one_attached :main_image

  validates :title, presence: true
  validates :release_date, presence: true

  scope :sorted, -> { order(Arel.sql("CASE WHEN file_under IS NULL OR file_under = '' THEN lower(title) ELSE lower(file_under) END ASC")) }
end