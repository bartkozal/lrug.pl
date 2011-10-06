# encoding: UTF-8

class Admin::EventsController < Admin::BasicAuthController
  def index
    @event = Event.new
    @events = Event.all
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to root_path
    else
      redirect_to admin_path, alert: "Event nie został utworzony"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    redirect_to admin_path if @event.destroy
  end
end
