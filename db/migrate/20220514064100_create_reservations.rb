class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_at, null: false
      t.date :end_at, null: false
      t.integer :number_of_guests, null: false

      t.timestamps
    end
  end
end
