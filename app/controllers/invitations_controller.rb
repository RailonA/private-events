class InvitationsController < ApplicationController
    include InvitationsHelper

    def index
      @invitations = invitation.all
    end
  
    def new
      @invitation = Invitation.new
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

end