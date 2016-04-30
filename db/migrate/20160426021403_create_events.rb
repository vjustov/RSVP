class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.timestamp :date
      t.integer :seat_limit

      t.timestamps
    end
  end
end
