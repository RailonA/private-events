class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event
      t.datetime :date
      t.string :location
      t.text :description
      t.references :user,  :foreign_key => 'creator_id'

      t.timestamps
    end
  end
end
