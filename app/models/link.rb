# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
