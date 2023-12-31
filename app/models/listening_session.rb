# frozen_string_literal: true

class ListeningSession < ApplicationRecord
  extend FriendlyId

  enum session_type: { remote: 'remote', party: 'party', maestros_basement: 'maestros_basement',
                       movie_night: 'movie_night' }

  has_many :listening_session_albums, dependent: :destroy
  has_many :listening_session_movies, dependent: :destroy
  has_many :albums, through: :listening_session_albums
  has_many :movies, through: :listening_session_movies
  has_many :yokos_member_listening_sessions, dependent: :destroy
  has_many :attendees, through: :yokos_member_listening_sessions, source: :yokos_member
  has_many :links, as: :owner, dependent: :destroy
  has_many_attached :images

  validates :session_type, presence: true
  validates :date, uniqueness: true

  friendly_id :date, use: :slugged

  scope :sorted, -> { order(date: :desc) }

  def main_image
    images.first
  end
end
