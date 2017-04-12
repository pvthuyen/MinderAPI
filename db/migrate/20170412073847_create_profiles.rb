class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.timestamps
      t.string :name
      t.string :facebook_id
      t.date :DOB
      t.boolean :gender
      t.boolean :bike
      t.float :origin_lat, :origin_lng, :destination_lat, :destination_lng
    end
  end
end
