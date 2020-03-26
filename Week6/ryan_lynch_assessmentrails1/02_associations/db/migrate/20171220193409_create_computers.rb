class CreateComputers < ActiveRecord::Migration[5.1]
  def change
    create_table :computers do |t|
      t.string :model
      t.integer :owner_id

      t.timestamps
    end
  end
end
