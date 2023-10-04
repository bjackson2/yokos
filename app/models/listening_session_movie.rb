# frozen_string_literal: true

class ListeningSessionMovie < ApplicationRecord
  belongs_to :listening_session
  belongs_to :movie

  validates :movie, presence: true
  validates :listening_session, presence: true
end
