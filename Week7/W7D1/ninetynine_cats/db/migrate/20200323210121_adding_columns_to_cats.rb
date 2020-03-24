class AddingColumnsToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :birth_date, :date, null: false    
   
    # t.string :color, null: false
    # t.string :name, null: false
    # t.string :sex, null: false, limit: 1
    # t.text :description, null: false
  end
end
# add_column :products, :part_number, :string