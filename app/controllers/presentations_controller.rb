# encoding: UTF-8

class PresentationsController < ApplicationController
  def edit
    @presentation = Presentation.find(params[:id])
    unless current_user
      session[:presentation_id] = @presentation.id
      redirect_to '/auth/github'
    end
  end

  def update
    @presentation = Presentation.find(params[:id])
    @presentation.topic = params[:presentation][:topic]
    @presentation.user = current_user
    if @presentation.save
      redirect_to root_path
    else
      render :action => 'edit', :alert => "Prezentacja nie została zgłoszona"
    end
  end
end
