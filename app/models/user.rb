class User < ActiveRecord::Base
  
  before_save {self.email = email.downcase}

  VALID_EMAIL_REGEX = /[\w.+\-]+@[a-z\-.]+\.[a-z]+/i

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  
  has_secure_password

  validates :password, length: {minimum: 6}

  def User.digest(string)
    # cost here is the computational cost. Bcrypt is designed to be slow to make it difficult for brute-force
    # but here we want the cost to be low, ie more speed as it is just a test
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
  end
end
