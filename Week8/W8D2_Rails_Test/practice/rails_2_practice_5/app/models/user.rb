class User < ApplicationRecord
    validates :username, :session_token, :password_digest, presence: true 
    validates :username, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }

    attr_reader :password
    after_initialize :ensure_session_token!

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def check_password(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.base64(64)
        self.save
        self.session_token
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        return nil if user.nil?

        if user.check_password(password)
            return user
        else
            return nil 
        end
    end

    has_many :goals,
        foreign_key: :user_id,
        class_name: :Goal

    private 

    def ensure_session_token!
        self.session_token ||= reset_session_token!
    end
end
