module InvitationsHelper
    def invitation_params
      params.permit(:event_attendee_id, :attended_event_id)
    end
  end