class ListeningSession < ApplicationRecord
  enum type: { remote: 'remote', party: 'party', maestros_basement: 'maestros_basement' }

  has_many :listening_session_albums
  has_many :albums, through: :listening_session_albums
  has_many :yokos_member_listening_sessions
  has_many :attendees, through: :yokos_member_listening_sessions, source: :yokos_member

  validates :date, presence: true
  validates :session_type, presence: true
end