class Event < ApplicationRecord
    has_many :event_attended, foreign_key: :event_attended_id, dependent: :destroy
    has_many :attendees, through: :invitation, source: :event_attended, dependent: :destroy
    belongs_to :creator, class_name: 'User'
  
    scope :upcoming, -> { where('date >= ?', DateTime.now) }
    scope :past, -> { where('date < ? ', DateTime.now) }
  end