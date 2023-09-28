# frozen_string_literal: true

class LinksController < ApplicationController
  include LinkHelper

  def new
    @link = Link.new(owner:)
  end

  def create
    @link = Link.new(link_params.merge(owner:))
    @link.save

    if @link.errors.any?
      render :new
    else
      redirect_to link_form_redirect_path(@link)
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)

    if @link.errors.any?
      render :edit
    else
      redirect_to link_form_redirect_path(@link)
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy!

    redirect_to link_form_redirect_path(@link), notice: 'Link deleted'
  end

  private

  def link_params
    params.require(:link).permit(:text, :uri)
  end

  def owner
    @owner ||= params[:owner_type].constantize.find(params[:owner_id])
  end
end
