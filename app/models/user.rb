class User < ActiveRecord::Base
  
  # creates a virtual attribute remember_token which exists only in memory and not in db
  attr_accessor :remember_token, :activation_token

  before_save :downcase_email 
  before_create :create_activation_digest

  VALID_EMAIL_REGEX = /[\w.+\-]+@[a-z\-.]+\.[a-z]+/i

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  
  has_secure_password

  validates :password, length: {minimum: 6}

  def User.digest(string)
    # cost here is the computational cost. Bcrypt is designed to be slow to make it difficult for brute-force
    # but here we want the cost to be low, ie more speed as it is just a test
    #cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    return BCrypt::Password.create(string)
  end

  # returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # remember a user in the db for use in peristent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # forget the user in peristent session
  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
   digest = self.send("#{attribute}_digest")
   return false if digest.nil?
   BCrypt::Password.new(digest).is_password?(token)
   #sha1_password = Digest::SHA1.hexdigest(remember_token)
   #BCrypt::Password.new(remember_digest) == sha1_password
  end

  #activate an account
  def activate
    self.update_attribute(:activated, true)
    self.update_attribute(:activated_at, Time.zone.now)
  end
  
  #sends activation email
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  #sets the password reset attributes 
  def create_reset_digest
    self.reset_token = User.new_token
    self.update_attribute(:reset_digest, User.digest(reset_token))
    self.update_attribute(:reset_sent_at, Time.zone.now)
  end
  
  private
  
  #creates and assigns the activation token and digest
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  #converts email to all lower-case
  def downcase_email
    self.email = email.downcase
  end
end
