# frozen_string_literal: true

class User < ApplicationRecord
  has_one :yokos_member

  validates :email, presence: true
end
