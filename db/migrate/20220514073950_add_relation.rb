class AddRelation < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :user
    add_reference :reservations, :room
    add_reference :rooms, :user
  end
end
