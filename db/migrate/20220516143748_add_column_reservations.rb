class AddColumnReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :total_amount, :integer
  end
end
