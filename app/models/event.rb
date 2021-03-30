class Event < ApplicationRecord
    belongs_to :user, :foreign_key => 'creator_id'
   

    has_many :invitation,
    class_name: "Invitation",
    foreign_key: :attended_event
end
