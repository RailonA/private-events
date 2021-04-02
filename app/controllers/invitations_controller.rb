class InvitationsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_invitation, only: [:show,:new, :create, :edit, :update]
  before_action :require_invitation!, only: [:show, :new, :create, :edit, :update]

  before_action :set_invitation, only: [:accept, :pend, :decline]
  before_action :require_invitation!, only: [:accept, :pend, :decline]

  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
  end

  def show
    @invitation = Invitation.find(params[:id]) 
  end

  
  def create
    invitation_params.select { |_k, v| v == '1' }.keys.map(&:to_i).each do |user_id|
      @event.invitations.find_or_create_by(invitation: user_id)
    end
    redirect_to users_path(@user)
  end

  # Hash[Invitation.where(invitation_id: @invitation.id).pluck(:key, :value)]

  # def create
  #   @event = Event.find(params[:event_id])
  #   @invitation = Invitation.new(invitation_params)
  #   @invitation.attended_event_id = @event.id 
  #   if @invitation.save
  
  #     redirect_to user_invitation_path(current_user)
  #   else
  #      render :new
  #   end
  # end

  def edit
    if @event.date < Time.current
      flash.notice = 'You cannot update invitations for past events.'
      redirect_to @event
    else
      render :edit
    end
  end

  def update
    no_uninvites = []
    params[:recipient].each do |user_id, value|
      if value == '1'
        @event.invitations.find_or_create_by(recipient_id: user_id.to_i)
      else
        invitation = @event.invitations.includes(:recipient).find_by(recipient_id: user_id.to_i)
        if invitation
          if invitation.rsvp == 'ACCEPTED'
            no_uninvites << invitation.recipient_name
          else
            invitation.destroy
          end
        end
      end
    end
    flash.notice = "The following guests have already commited and cannot be uninvited: #{no_uninvites.join(', ')}." unless no_uninvites.empty?
    redirect_to event_url(@event)
  end

  # def accept
  #   @invitation.update(rsvp: 'ACCEPTED')
  #   redirect_to profile_path(anchor: 'invitations')
  # end

  # def pend
  #   @invitation.update(rsvp: 'PENDING')
  #   redirect_to profile_path(anchor: 'invitations')
  # end

  # def decline
  #   @invitation.update(rsvp: 'DECLINED')
  #   redirect_to profile_path(anchor: 'invitations')
  # end

  private

  def invitation_params
    params.permit(:attendee, :attended_event_id)

    # params.require(:invitation).permit(:attendee, :attended_event_id)
  end



  # def set_invitation
  #   @invitation = Invitation.find(params[:id])
  # end



  # def require_user!
  #   unless current_user.try(params[:id]) == @event
  #     flash[:alert] = 'You are not authorized to edit invitations for this event!'
  #     redirect_to root_url
  #   end
  # end

  def require_recipient!
    unless current_user.try(:id) == @invitation.recipient_id
      flash[:alert] = 'You are not authorized to respond to this invitation!'
      redirect_to root_url
    end
  end
end