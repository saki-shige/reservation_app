class AddColumnIntroductionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :introduction, :text
  end
end
