# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  private

  def validate_user
    redirect_to root_path unless can_edit_data?
  end
end
