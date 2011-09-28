class EventsController < ApplicationController
  def index
    @events = Event.includes(:presentations).order("planned_at DESC")
  end
end
