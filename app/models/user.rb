class User < ApplicationRecord
	attr_accessor  :reset_token
	before_save { self.email = email.downcase }
	has_many :policies, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: true
	validates :contact_number, length: { is: 10 }, uniqueness: true, numericality: { only_integer: true }, allow_nil: true
	validates :address, length: { maximum: 100 }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	# Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
																									BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

	# Sets the password reset attributes.
	def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
	end

	# Sends password reset email.
	def send_password_reset_email
	  UserMailer.password_reset(self).deliver_now
	end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
    
end
