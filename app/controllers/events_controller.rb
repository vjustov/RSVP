class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @registration = Registration.new
    @event = Event.find(event_id)
  end

  private

  def event_id
    params[:id]
  end
end
