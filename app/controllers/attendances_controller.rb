class AttendancesController < ApplicationController
    def create
    @event = Event.find(params[:attendance][:attended_event_id])
      current_user.attend!(@event) unless current_user.attending?(@event)
      flash.notice = "#{current_user.name} is now attending this event!"
      redirect_to @event
    end
  end
