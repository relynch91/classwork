class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :session_token, presence: true 
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6 }

    attr_reader :password

    has_many :goals,
        foreign_key: :author_id,
        class_name: :Goal

    def password= (password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        # new_password_digest = BCrypt::Password.create(password)
        if user #&& user.is_password?(password)
            return user 
        # else 
        #     nil 
        end
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

end
