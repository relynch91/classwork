require 'bcrypt'

class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true

    after_initialize :ensure_session_token

    def self.generate_session_token
        self.SecureRandom.urlsafe_base64
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        @session_token ||= User.generate_session_token
    end

    def password= (password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrpyt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil unless user
        if user.is_password?(password)
            user
        else
            nil
        end
    end


end 
