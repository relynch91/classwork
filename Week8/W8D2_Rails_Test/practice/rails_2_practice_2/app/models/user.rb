class User < ApplicationRecord
    validates :username, :session_token, :password_digest, presence: true
    validates :username, uniqueness: true 
    validates :password, length: {minimum: 6, allow_nil: true } 
    after_initialize :ensure_session_token
    attr_reader :password
    
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.base64(64)
        self.save
        self.session_token 
    end

    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
        return nil if @user.nil?

        if @user.is_password?(password)
            return @user
        else
            return nil
        end
    end



    has_many :goals,
        foreign_key: :user_id,
        class_name: :Goal


    private

    def ensure_session_token
        self.session_token ||= reset_session_token!
    end

end
