# frozen_string_literal: true

class Gallery < ApplicationRecord
  extend FriendlyId

  has_many_attached :images
  has_many :links, as: :owner

  validates :name, presence: true

  before_validation :format_values

  friendly_id :name, use: :slugged

  scope :sorted, -> { order(name: :asc) }

  private

  def format_values
    self[:name] = self[:name].to_s.strip
  end
end
