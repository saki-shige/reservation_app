class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, limit: 30, null: false
      t.text :introduction, limit: 100
      t.integer :price, limit: 10, null: false
      t.text :address, limit: 100, null: false

      t.timestamps
    end
  end
end
