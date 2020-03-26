class AddColumnsAndConstraints < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false 
      t.string :session_token, null: false 
    end
  end
end
