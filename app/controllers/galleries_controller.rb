# frozen_string_literal: true

class GalleriesController < ApplicationController
  before_action :validate_user

  def index
    @galleries = Gallery.sorted.page(1)
  end

  def show
    @gallery = Gallery.friendly.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params[:gallery])
    @gallery.save

    if @gallery.errors.any?
      flash.now[:error] = model_error_display(@gallery)

      render :new
    else
      redirect_to gallery_path(@gallery)
    end
  end

  def edit
    @gallery = Gallery.friendly.find(params[:id])
  end

  def update
    @gallery = Gallery.friendly.find(params[:id])
    @gallery.update(gallery_params[:gallery])

    if @gallery.errors.any?
      flash.now[:error] = model_error_display(@gallery)

      render :edit
    else
      redirect_to gallery_path(@gallery)
    end
  end

  private

  def gallery_params
    params.permit(
      :authenticity_token,
      gallery: [
        :name,
        :notes,
        { images: [] }
      ]
    )
  end
end
