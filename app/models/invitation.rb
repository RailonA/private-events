class Invitation < ApplicationRecord
  belongs_to :event, :foreign_key => 'attended_event_id', class_name: "Event"
  belongs_to :user, :foreign_key => 'attendee_id', class_name: "User"


  def accepted?
    rsvp == 'ACCEPTED'
  end

  def accept!
    update(rsvp: 'ACCEPTED')
  end

  def decline!
    update(rsvp: 'DECLINED')
  end

  def recipient_name
    recipient.username
  end

  private

  def ensure_rsvp
    rsvp ||= 'PENDING'
  end
end
