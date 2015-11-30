class User < ActiveRecord::Base
  has_many :teams, dependent: :destroy

  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  validates :name, presence: true, length: { maximum: 50 }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  #above 2lines ensure only email addresses that match pattern will be considered valid; has weaknesss s.t. allows invalid addresses that contain consecutive dots, ie. foo@bar..com
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  
  class << self
    #returns the hash digest of the given string
    def digest(string)
       cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
       BCrypt::Password.create(string, cost: cost)
    end

     #returns a random token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

   #remembers a user in the DB for use in persistent sessions
   def remember
     self.remember_token = User.new_token #allows to make a token available via user.remember_token (for storage in the cookies) w/o storing it in the DB
	 update_attribute(:remember_digest, User.digest(remember_token))
   end


   def authenticated?(attribute, token) 
     digest = send("#{attribute}_digest")
     return false if digest.nil? #return false immediately if digest is nil
     BCrypt::Password.new(digest).is_password?(token)
   end


   # Forgets a user (to allow users to logout)
   def forget
     update_attribute(:remember_digest, nil)
   end

   # activates an account
   def activate
     update_columns(activated: true, activated_at: Time.zone.now)
     #update_attribute(:activated, true)
     #update_attribute(:activated, Time.zone.now)
   end
   
   # sends activation email
   def send_activation_email
      UserMailer.account_activation(self).deliver_now
   end

   # sets the passworld reset attributes
   def create_reset_digest
     self.reset_token = User.new_token
     update_columns(reset_digest: User.digest(reset_token),
                    reset_sent_at: Time.zone.now)
     #update_attribute(:reset_digest, User.digest(reset_token))
     #update_attribute(:reset_sent_at, Time.zone.now)
   end

   # sends password reset email
   def send_password_reset_email
     UserMailer.password_reset(self).deliver_now
   end

   # returns true if a password reset has expired
   def password_reset_expired?
     reset_sent_at < 2.hours.ago
   end

   private
   
      #converts email to all lower-case
      def downcase_email
        self.email = email.downcase
      end 

      #creates & assigns the activation token & digest
      def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
      end

end
