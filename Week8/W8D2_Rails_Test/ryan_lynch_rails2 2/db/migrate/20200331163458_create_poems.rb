class CreatePoems < ActiveRecord::Migration[5.2]
  def change
    create_table :poems do |t|
      t.string :title, null: false 
      t.string :stanzas, null: false 
      t.boolean :complete, null: false 
      t.integer :user_id, null: false 
      t.timestamps
    end
  end
end
