class InvitationsController < ApplicationController
    include InvitationsHelper

    # def index
    #   @invitations = Invitation.all
    # end
  
    def new
      @invitations = Invitation.new
    end
  
    def create
      @invitation = Invitation.new(invitation_params)
  
      if @invitation.save
        redirect_to events_path
        flash[:notice] = 'Your subscription to this event is approved!'
      else
        render 'new'
      end
    end


    private

    def invitation_params
      # params.require(:invitations).permit(:attendee_id, :event_attended_id)
      params.permit(:attendee_id, :event_attended_id)

    end
end