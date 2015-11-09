class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  #using a "before_save" callback which downcases(a string method) the email attribute before the user is saved

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #V_E_R is a constant

  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  #lines 3 & 5 ensure that only email addresses that match pattern will be considered valid; has a weaknesss s.t. it allows invalid addresses that contain consecutive dots, ie. foo@bar..com

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  #returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
