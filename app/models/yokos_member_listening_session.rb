# frozen_string_literal: true

class YokosMemberListeningSession < ApplicationRecord
  belongs_to :yokos_member
  belongs_to :listening_session
end
