class RemoveUniqueConstraintFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_index :reservations, [:room_id, :check_in, :check_out]
  end
end
