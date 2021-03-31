class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :events,
         class_name: "Event",
         foreign_key: :creator_id
    
        has_many :invitation,
        class_name: "Invitation",
        foreign_key: :attendee_id

        has_many :confirmations,
        -> { where rsvp: 'ACCEPTED' },
        class_name: :Invitation,
        foreign_key: :attendee_id
        
        has_many :commitments,
        through: :confirmations,
        source: :event

end
