class AddEventIdToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :event_id, :string
  end
end
