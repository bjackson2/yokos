# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :artist
  has_many :listening_session_albums, dependent: :destroy
  has_many :listening_sessions, through: :listening_session_albums
  has_many :pickers, through: :listening_session_albums, as: :yokos_member
  has_many :links, as: :owner, dependent: :destroy
  has_one_attached :main_image

  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: :artist_id }
  validates :release_date, presence: true

  before_validation :format_values

  # rubocop:disable Layout/LineLength
  scope :sorted, lambda {
                   order(Arel.sql("CASE WHEN albums.file_under IS NULL OR albums.file_under = '' THEN lower(albums.title) ELSE lower(albums.file_under) END ASC"))
                 }
  # rubocop:enable Layout/LineLength
  scope :chronological, -> { order(release_date: :asc) }

  private

  def format_values
    self[:title] = self[:title].to_s.strip
    self[:file_under] = self[:file_under].to_s.strip
  end
end
