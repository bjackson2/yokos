# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :owner, polymorphic: true

  def text
    super.presence || uri
  end
end
