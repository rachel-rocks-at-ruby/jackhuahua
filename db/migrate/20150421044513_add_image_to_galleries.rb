class AddImageToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :image, :string
  end
end
