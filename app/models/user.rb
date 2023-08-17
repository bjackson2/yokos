class User < ApplicationRecord
  has_one :yokos_member

  validates :email, presence: true
end