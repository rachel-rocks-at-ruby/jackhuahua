class RemoveFilepickerUrlFromGalleries < ActiveRecord::Migration
  def up
    remove_column :galleries, :filepicker_url, :string
    remove_column :galleries, :image, :string
  end
end
