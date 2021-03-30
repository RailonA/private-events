class InvitationsController < ApplicationController

    private

    def invitation_params
      params.require(:invitation).permit(:attendee__id, :attended_event_id )
    end
end