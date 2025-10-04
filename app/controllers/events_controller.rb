class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def attend
    @event = Event.find(params[:id])
    current_user.attended_events << @event
    redirect_to @event, notice: "You're attending this event!"
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :event_date)
  end
end
