# encoding: UTF-8

class Admin::PresentationsController < Admin::BasicAuthController
  def destroy
    @presentation = Presentation.find(params[:id])
    @presentation.event.presentations << Presentation.new
    @presentation.destroy
    redirect_to admin_events_path, alert: 'Prezentacja usunięta'
  end
end
