class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :guests
      t.integer :total_price
      t.datetime :confirmed_at
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end

    add_index :reservations, [:room_id, :check_in, :check_out], unique: true
  end
end