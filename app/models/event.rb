class Event < ApplicationRecord
    belongs_to :user, :foreign_key => 'creator_id'
   

    has_many :invitation,
    class_name: "Invitation",
    foreign_key: :attended_event_id, 
    through: :user

    has_many :attendee,
    through: :invitation,
    source: :user

    scope :upcoming_events, -> { where('date >= ?', Date.today) }
    scope :past_events, -> { where('date < ?', Date.today) }
    def user_name
        user.username
      end
    
      def date_and_time
        date.strftime('%b %-d %Y %l:%M%P')
      end
    
      def date_only
        date.strftime('%b %-d %Y')
      end
    
      private
    
      def starts_in_the_future
        if date < Date.today
          errors[:date] << 'Event date must be in the future.'
        end
      end
end
