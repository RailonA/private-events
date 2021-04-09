

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  
  has_many :attended_events, through: :invitations, source: :event_attended
  has_many :attendee, foreign_key: 'attendee_id', class_name: 'Invitation', dependent: :destroy
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy


  def attending?(event)
    attended_events.include?(event)
  end

end 

