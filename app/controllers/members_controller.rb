# frozen_string_literal: true

class MembersController < ApplicationController
  def index
    @yokos_members = YokosMember.all.sorted
  end

  def show
    @yokos_member = YokosMember.find(params[:id])
  end
end
