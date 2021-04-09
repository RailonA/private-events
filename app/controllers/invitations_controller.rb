class InvitationsController < ApplicationController
    include InvitationsHelper

    def index
      @invitations = Invitation.all
    end

  def show
  end

    def new
      @invitations = Invitation.new
    end
  
    def create
      @invitation = Invitation.new(invitation_params)
  
      if @invitation.save
        redirect_to events_path
        flash[:notice] = 'Your subscription to this event is approved!'
      else
        redirect_to new_invitation_path
       end
    end


    # def create
    #   @event = Event.find(params[:id])
    #   @attended_event = @event.invitations.create(attendee: current_user)
    #   # current_user.attended_events << @event
    #   if @attended_event.save
    #     redirect_to events_path, notice: 'Thanks for following'
    #   else
    #     redirect_to events_path, alert: 'You can only attend once (Matrix! Perhaps!?)'
    #   end
    # end
    


    private

    def invitation_params
      #  params.require(:invitations)
      #  params.require(:invitation).permit(:attendee_id, :event_attended_id)
       params.permit(:attendee_id, :event_attended_id)

    end
end



 

