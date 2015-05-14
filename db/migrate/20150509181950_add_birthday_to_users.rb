class AddBirthdayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_index :users, :birthday
  end
end
