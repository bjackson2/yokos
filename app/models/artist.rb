# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :albums
  has_many :links, as: :owner
  has_one_attached :main_image
  has_many_attached :images

  validates :name, presence: true

  # rubocop:disable Layout/LineLength
  scope :sorted, lambda {
                   order(Arel.sql("CASE WHEN file_under IS NULL OR file_under = '' THEN lower(name) ELSE lower(file_under) END ASC"))
                 }
  # rubocop:enable Layout/LineLength
end
