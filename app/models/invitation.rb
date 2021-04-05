class Invitation < ApplicationRecord
    belongs_to :attendee, foreign_key: "attendee_id", class_name: 'User'
    belongs_to :event_attended, foreign_key: "event_attended_id", class_name: 'Event'
end
