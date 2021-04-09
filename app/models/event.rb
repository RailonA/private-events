class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :invitations, foreign_key: :event_attended_id
  has_many :attendees, through: :invitations, source: :attendee


    scope :upcoming, -> { where('date >= ?', DateTime.now) }
    scope :past, -> { where('date < ? ', DateTime.now) }
  end

