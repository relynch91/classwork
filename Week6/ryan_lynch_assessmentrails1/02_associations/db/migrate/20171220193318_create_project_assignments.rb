class CreateProjectAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :project_assignments do |t|
      t.integer :programmer_id
      t.integer :project_id

      t.timestamps
    end
  end
end
