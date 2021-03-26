class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event
      t.datetime :date
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
