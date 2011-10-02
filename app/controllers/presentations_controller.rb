# encoding: UTF-8

class PresentationsController < ApplicationController
  def edit
    @presentation = Presentation.find(params[:id])
  end

  def update
    @presentation = Presentation.find(params[:id])
    if @presentation.update_attributes(params[:presentation])
      redirect_to root_path
    else
      render :action => 'edit', :alert => "Prezentacja nie została zgłoszona"
    end
  end
end
