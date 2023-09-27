# frozen_string_literal: true

class ListeningSession < ApplicationRecord
  enum session_type: { remote: 'remote', party: 'party', maestros_basement: 'maestros_basement',
                       movie_night: 'movie_night' }

  has_many :listening_session_albums
  has_many :albums, through: :listening_session_albums
  has_many :yokos_member_listening_sessions
  has_many :attendees, through: :yokos_member_listening_sessions, source: :yokos_member
  has_many_attached :images

  validates :session_type, presence: true

  scope :sorted, -> { order(date: :desc) }

  def main_image
    images.first
  end
end
