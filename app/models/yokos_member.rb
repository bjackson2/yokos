class YokosMember < ApplicationRecord
  has_many :listening_session_albums
  has_many :picks, through: :listening_session_albums, source: :album
  has_many :yokos_member_listening_sessions
  has_many :listening_sessions, through: :yokos_member_listening_sessions
  belongs_to :user

  validates :name, presence: true

  scope :sorted, -> { order(name: :asc) }
end