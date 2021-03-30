class Invitation < ApplicationRecord
  belongs_to :event, :foreign_key => 'attended_event_id', class_name: "Event"
  belongs_to :user, :foreign_key => 'attendee_id', class_name: "User"
end
