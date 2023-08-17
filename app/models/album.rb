class Album < ApplicationRecord
  belongs_to :artist
  has_many :listening_sessions, through: :listening_session_albums
  has_many :pickers, through: :listening_session_albums, as: :yokos_member

  validates :title, presence: true
  validates :release_date, presence: true
end