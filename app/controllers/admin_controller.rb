# frozen_string_literal: true

class AdminController < ApplicationController
  include ApplicationHelper

  def index; end

  private

  def validate_user
    redirect_to root_path unless can_edit_data?
  end
end
