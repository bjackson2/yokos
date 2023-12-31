# frozen_string_literal: true

class ListeningSessionAlbum < ApplicationRecord
  belongs_to :listening_session
  belongs_to :album
  belongs_to :yokos_member

  validates :album, presence: true
  validates :listening_session, presence: true

  scope :date_sorted, -> { joins(:listening_session).order('listening_sessions.date desc') }
end
