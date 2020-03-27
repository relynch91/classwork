class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body 
      t.string :author_id
      t.string :blog_id
      t.timestamps
    end
  end
end
