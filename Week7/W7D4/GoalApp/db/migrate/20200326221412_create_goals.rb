class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.string :author_id, null: false 
      t.text :description
      t.timestamps
    end
  end
end
