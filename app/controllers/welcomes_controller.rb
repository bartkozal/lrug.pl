class WelcomesController < ApplicationController
  def show
    @presentations = Event.last.presentations
  end
end