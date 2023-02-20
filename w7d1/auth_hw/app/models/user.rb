# require "bcrypt"

class User < ApplicationRecord
    attr_reader :password

    before_validation :ensure_session_token
    validates :username, :session_token,  presence: true
    validates :password_digest, presence: { message: "Password can't be blank"}
    validates :password, length: { minimum: 6 }, allow_nil: true
    
    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        # if you cannot find a user with that username, return nil
        user.is_password?(password) ? user : nil
        # if the entered pass 'matches' the pass_digest, return user, else nil
    end

    def generate_unique_session_token
        loop do
            session_token = SecureRandom::urlsafe_base64(16)
            return session_token unless User.exists?(session_token: session_token)
            # keep generating until a token that no user has is made
        end
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
        # create a password_digest
    end

    def is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password)
        # does password 'match' stored password_digest
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token
        # create a new session token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

end