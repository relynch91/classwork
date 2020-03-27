class AddingAuthorId < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :author_id, :integer, presence: true 
  end
end
