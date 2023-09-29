# frozen_string_literal: true

module ApplicationHelper
  def can_edit_data?
    user_signed_in?
  end
end
