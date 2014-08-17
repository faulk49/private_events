class EventsController < ApplicationController

  def index
    @events = Event.all
    @upcoming_events = Event.upcoming
    @past_events = Event.past

  end


  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Congratulations! New Event Created!'
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end


  private

      def event_params
        params.require(:event).permit(:description, :date)
      end



end
