class Artist < ApplicationRecord
  has_many :albums
  has_one_attached :main_image
  has_many_attached :images

  validates :name, presence: true

  scope :sorted, -> { order(Arel.sql("CASE WHEN file_under IS NULL OR file_under = '' THEN lower(name) ELSE lower(file_under) END ASC")) }
end