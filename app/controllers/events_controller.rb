class EventsController < ApplicationController
  include EventsHelper

  
  before_action :set_event, only: %i[show edit destroy update]
  before_action :signed_in?, only: [:index]

  def index
    @events = Event.all
    @upcoming = Event.upcoming
    @past = Event.past.sort { |a, b| b.date <=> a.date }
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event successfully created'
      redirect_to event_path(@event)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @invitations = Invitation.all
    @attendees = @event.attendees
    @users = User.all
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:description, :title, :date, :location)
  end
end