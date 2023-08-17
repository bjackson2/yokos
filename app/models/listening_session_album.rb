class ListeningSessionAlbum < ApplicationRecord
  belongs_to :listening_session
  belongs_to :album
  belongs_to :yokos_member
end