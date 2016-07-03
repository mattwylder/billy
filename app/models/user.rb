class User < ActiveRecord::Base
    has_many :billythoughts, dependent: :destroy

    attr_accessor :remember_token
    validates :name, presence: true, uniqueness: true
    has_secure_password
    
    # Returns the hash digest of the given string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # returns a random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # remembers a user in the database for use in persistent sessions
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # forgets a user
    def forget
        update_attribute(:remember_digest, nil)
    end

    # Returns true if the given token matches the digest
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
end
