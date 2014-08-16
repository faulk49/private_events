class EventsController < ApplicationController

  def index
    @events = Event.all
  end


  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
    redirect_to event_path(@event)
  end

  def show
    @event = Event.find(params[:id])
  end


  private

      def event_params
        params.require(:event).permit(:description)
      end



end
