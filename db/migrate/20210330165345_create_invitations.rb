class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      # t.references :event, :foreign_key => 'attended_event'
      # t.references :user,  :foreign_key => 'attendee'

      t.references :attendee, index: true, foreign_key: {to_table: :users}
      t.references :attended_event, index: true, foreign_key: {to_table: :events}

      t.timestamps
    end
  end
end
