class AddUniqueIndexToReservations < ActiveRecord::Migration[6.1]
  def up
    remove_index :reservations, [:room_id, :check_in, :check_out]
    add_index :reservations, [:room_id, :check_in, :check_out], unique: true
  end

  def down
    remove_index :reservations, [:room_id, :check_in, :check_out]
  end
end