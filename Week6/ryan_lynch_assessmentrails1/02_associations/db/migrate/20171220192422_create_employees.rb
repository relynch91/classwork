class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.integer :campus_id

      t.timestamps
    end
  end
end
