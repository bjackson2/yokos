# frozen_string_literal: true

class Movie < ApplicationRecord
  extend FriendlyId

  belongs_to :artist, optional: true
  has_many :listening_session_movies
  has_many :listening_sessions, through: :listening_session_movies
  has_many :links, as: :owner
  has_one_attached :main_image

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :release_year, presence: true

  before_validation :format_values

  friendly_id :title, use: :slugged

  # rubocop:disable Layout/LineLength
  scope :sorted, lambda {
                   order(Arel.sql("CASE WHEN movies.file_under IS NULL OR movies.file_under = '' THEN lower(movies.title) ELSE lower(movies.file_under) END ASC"))
                 }
  # rubocop:enable Layout/LineLength

  private

  def format_values
    self[:title] = self[:title].to_s.strip
    self[:file_under] = self[:file_under].to_s.strip
  end
end
