
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }

  has_many :event_attended, foreign_key: :event_attended_id, dependent: :destroy
  has_many :attended_event, through: :attendee, dependent: :destroy
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event', dependent: :destroy
end