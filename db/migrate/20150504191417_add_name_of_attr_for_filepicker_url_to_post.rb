class AddNameOfAttrForFilepickerUrlToPost < ActiveRecord::Migration
    def change
        add_column :posts, :filepicker_url, :string
    end
end
