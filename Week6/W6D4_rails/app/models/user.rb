class User < ApplicationRecord
    validates :name, :email, presence: true
end

User.create(name:"Fred", email:"fred@fred.com")
User.create(name:"Bob", email:"bob@bob.com")
