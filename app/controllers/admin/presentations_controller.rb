# encoding: UTF-8

class Admin::PresentationsController < Admin::BasicAuthController
  def edit
    @presentation = Presentation.find(params[:id])
    render :edit
  end

  def update
    @presentation = Presentation.find(params[:id])
    @presentation.update_attributes(params[:presentation])
    redirect_to admin_events_path, alert: 'Prezentacja zmieniona'
  end

  def destroy
    @presentation = Presentation.find(params[:id])
    @presentation.event.presentations << Presentation.new
    @presentation.destroy
    redirect_to admin_events_path, alert: 'Prezentacja usunięta'
  end
end

