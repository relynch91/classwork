class ChangingAuthorIDtype < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :author_id
  end
end
