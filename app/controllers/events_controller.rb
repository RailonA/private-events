class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming = Event.upcoming
    @past = Event.past.sort { |a, b| b.date <=> a.date }
  end

  def new
    @event = current_user.creator.new
  end

  def create
    @event = current_user.creator.build(event_params)
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
    @users = User.all
  end

  private

  def event_params
    params.require(:event).permit(:description, :title, :date, :location)
  end
end