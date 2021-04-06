module InvitationsHelper
    def invitation_params
      params.permit(:attendee_id, :event_attended_id)
    end
  end