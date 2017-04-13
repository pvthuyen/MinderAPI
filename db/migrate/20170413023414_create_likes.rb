class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :liker_id
      t.integer :target_id
      t.boolean :status

      t.timestamps
    end
  end
end
