class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.references :user, index: true
      t.boolean :is_public, default: false
      t.timestamps
    end
  end
end
