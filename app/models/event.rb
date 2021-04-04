class Event < ApplicationRecord
    has_many :event_attended, foreign_key: "event_attended_id", class_name: 'Invitations', dependent: :destroy
    has_many :attendee, foreign_key: "attendee_id", class_name: 'Invitations', dependent: :destroy
    belongs_to :creator,foreign_key: "creator_id", class_name: 'User'
  
    scope :upcoming, -> { where('date >= ?', DateTime.now) }
    scope :past, -> { where('date < ? ', DateTime.now) }
  end

