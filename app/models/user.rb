# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
    :recoverable,
    :rememberable,
    :validatable,
    :lockable

  has_one :yokos_member

  validates :email, presence: true
end
