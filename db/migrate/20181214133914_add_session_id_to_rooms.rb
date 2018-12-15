class AddSessionIdToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :session_id, :string
  end
end
