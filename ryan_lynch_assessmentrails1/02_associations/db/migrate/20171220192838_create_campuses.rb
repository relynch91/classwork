class CreateCampuses < ActiveRecord::Migration[5.1]
  def change
    create_table :campuses do |t|
      t.string :name
      t.string :address
      t.integer :company_id
      t.integer :campus_manager_id

      t.timestamps
    end
  end
end
