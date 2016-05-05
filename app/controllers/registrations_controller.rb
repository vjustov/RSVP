class RegistrationsController < ApplicationController

  before_action :authenticate_user!, only: :index

  def index
    @registrations = Registration.where(email: current_user.email)
  end

  def create
    if Event.first.seat_limit > Registration.count
      if Registration.where(email:params[:registration][:email]).count < 1
        new_registration = Registration.create(params.require(:registration).permit(:email, :first_name, :last_name, :phone_number).merge({ event_id: params[:event_id] }))
      end
    end
  end
end
