# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :albums
  has_many :links, as: :owner
  has_one_attached :main_image
  has_many_attached :images

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_validation :format_values

  scope :sorted, lambda {
    order(Arel.sql("CASE WHEN file_under IS NULL OR file_under = '' THEN lower(name) ELSE lower(file_under) END ASC"))
  }

  private

  def format_values
    self[:name] = self[:name].strip
    self[:file_under] = self[:file_under].strip
  end
end
