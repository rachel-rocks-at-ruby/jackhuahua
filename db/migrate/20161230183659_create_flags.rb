class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :flagged, polymorphic: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
