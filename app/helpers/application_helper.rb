# frozen_string_literal: true

module ApplicationHelper
  def can_edit_data?
    user_signed_in?
  end

  def model_error_display(obj)
    "Error: #{obj.errors.full_messages.join(', ')}"
  end
end
