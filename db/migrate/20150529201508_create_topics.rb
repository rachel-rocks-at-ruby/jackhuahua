class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :user
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
