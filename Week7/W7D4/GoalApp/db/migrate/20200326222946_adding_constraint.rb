class AddingConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :author_id, :integer, null: false 
  end
end
