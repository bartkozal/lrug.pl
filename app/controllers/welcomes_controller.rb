class WelcomesController < ApplicationController
  def show
    @event = Event.first
  end
end