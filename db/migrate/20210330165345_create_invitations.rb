class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.references :event, :foreign_key => 'attended_event'
      t.references :user,  :foreign_key => 'attendee'

      t.timestamps
    end
  end
end
