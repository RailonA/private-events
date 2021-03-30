class InvitationsController < ApplicationController

    def index
        @invitations = Invitation.all

    end

    def new
    
    end

    def show
        @invitations = Event.find(params[:id])

    end

    def create
    
    end

end