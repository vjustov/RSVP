class RegistrationsController < ApplicationController

  before_action :authenticate_user!, only: :index

  def index
    @registrations = Registration.where(email: current_user.email)
  end

  def create
    if Event.first.seat_limit > Registration.count
      registration_parameters = params.require(:registration).permit(:email, :first_name, :last_name, :phone_number).merge({ event_id: params[:event_id] })
      @registration = Registration.new(registration_parameters)

      unless @registration.save
        flash.now[:error] = "Email already in use."
        @event = Event.find(params[:event_id])
        render 'events/show'
      end
    end
  end
end
