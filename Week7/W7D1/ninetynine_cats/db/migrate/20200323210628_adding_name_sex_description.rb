class AddingNameSexDescription < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :color, :string, null: false
    add_column :cats, :name, :string, null: false
    add_column :cats, :sex, :string, null: false, limit: 1
    add_column :cats, :description, null: false 
    # t.string :color, null: false
    # t.string :name, null: false
    # t.string :sex, null: false, limit: 1
    # t.text :description, null: false
  end
end
# add_column :tables, :column, :type, constraints: yup