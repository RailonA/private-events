class Invitation < ApplicationRecord
  belongs_to :event, :foreign_key => 'attended_event'
  belongs_to :user, :foreign_key => 'attendee'
end
