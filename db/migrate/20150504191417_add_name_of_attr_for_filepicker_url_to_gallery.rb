class AddNameOfAttrForFilepickerUrlToGallery < ActiveRecord::Migration
    def change
        add_column :galleries, :filepicker_url, :string
    end
end
