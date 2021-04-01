class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      # t.string "rsvp", default: "PENDING", null: false

      t.references :attendee, index: true, foreign_key: {to_table: :users}
      t.references :attended_event, index: true, foreign_key: {to_table: :events}

      t.timestamps
    end
  end
end
