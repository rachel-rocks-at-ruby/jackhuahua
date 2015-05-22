class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.references :gallery
    	t.string :image
    	t.datetime :created_at
    	t.datetime :updated_at

      	t.timestamps
    end
  end
end
